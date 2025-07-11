import 'package:flutter/material.dart';
import 'restaurant_products_screen.dart';

class RestaurantListScreen extends StatelessWidget {
  final List<Map<String, dynamic>> restaurants = [
    {
      "name": "The Pizza Place",
      "description": "Authentic Italian pizza and more.",
      "image":
          "https://images.unsplash.com/photo-1600891964599-f61ba0e24092?w=600",
      "rating": 4.5,
    },
    {
      "name": "Burger Town",
      "description": "Big juicy burgers with fries.",
      "image":
          "https://images.unsplash.com/photo-1550547660-d9450f859349?w=600",
      "rating": 4.2,
    },
    {
      "name": "Sushi World",
      "description": "Fresh sushi and sashimi daily.",
      "image":
          "https://images.unsplash.com/photo-1663334038419-71e6f82e333f?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c3VzaGklMjBwbGF0dGVyfGVufDB8fDB8fHww",
      "rating": 4.8,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Restaurants")),
      body: ListView.builder(
        itemCount: restaurants.length,
        itemBuilder: (context, index) {
          final restaurant = restaurants[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => RestaurantProductsScreen(
                    restaurant: restaurant,
                  ),
                ),
              );
            },
            child: Card(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    restaurant['image'],
                    width: double.infinity,
                    height: 180,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          restaurant['name'],
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4),
                        Text(restaurant['description']),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.amber, size: 20),
                            SizedBox(width: 4),
                            Text(restaurant['rating'].toString()),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
