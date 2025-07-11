import 'package:flutter/material.dart';
import 'product_details_screen.dart';

class RestaurantProductsScreen extends StatelessWidget {
  final Map<String, dynamic> restaurant;

  RestaurantProductsScreen({required this.restaurant});

  // Mock product list — ideally filtered per restaurant
  final List<Map<String, dynamic>> products = [
    {
      "name": "Margherita Pizza",
      "price": 8.99,
      "image":
          "https://images.unsplash.com/photo-1601924573558-6c92dfe98b0f?w=600",
      "description": "Classic pizza with tomato, mozzarella, and basil",
    },
    {
      "name": "Cheeseburger",
      "price": 6.49,
      "image":
          "https://images.unsplash.com/photo-1550547660-d9450f859349?w=600",
      "description": "Juicy grilled beef patty with cheddar cheese",
    },
    {
      "name": "California Roll",
      "price": 10.99,
      "image":
          "https://images.unsplash.com/photo-1579888577571-7c2dbe96cd49?w=600",
      "description": "Sushi roll with crab, avocado, and cucumber",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(restaurant['name'])),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Restaurant header
          Card(
            margin: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  restaurant['image'],
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
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
                      SizedBox(height: 4),
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

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              "Menu",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),

          // Products list
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (_, index) {
                final product = products[index];
                return ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  leading: Image.network(product['image'],
                      width: 60, height: 60, fit: BoxFit.cover),
                  title: Text(product['name']),
                  subtitle: Text("\$${product['price']}"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ProductDetailsScreen(product: product),
                      ),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
