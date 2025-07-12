import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/restaurant_provider.dart';
import 'restaurant_products_screen.dart';

class RestaurantListScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final restaurants = ref.watch(filteredRestaurantsProvider);
    final search = ref.watch(restaurantSearchProvider);

    return Scaffold(
      appBar: AppBar(title: Text("Restaurants")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Search Restaurants',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (val) =>
                  ref.read(restaurantSearchProvider.notifier).state = val,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: restaurants.length,
              itemBuilder: (context, index) {
                final r = restaurants[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => RestaurantProductsScreen(restaurant: r),
                      ),
                    );
                  },
                  child: Card(
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(r['image'],
                            height: 180,
                            fit: BoxFit.cover,
                            width: double.infinity),
                        Padding(
                          padding: EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(r['name'],
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(height: 4),
                              Text(r['description']),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  Icon(Icons.star,
                                      color: Colors.amber, size: 20),
                                  SizedBox(width: 4),
                                  Text(r['rating'].toString()),
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
          ),
        ],
      ),
    );
  }
}
