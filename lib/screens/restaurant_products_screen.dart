import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/product_provider.dart';
import 'product_details_screen.dart';

class RestaurantProductsScreen extends ConsumerWidget {
  final Map<String, dynamic> restaurant;

  RestaurantProductsScreen({required this.restaurant});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final search = ref.watch(productSearchProvider);
    final products = ref.watch(filteredProductsProvider(restaurant['name']));

    return Scaffold(
      appBar: AppBar(title: Text(restaurant['name'])),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(restaurant['image'],
              height: 180, width: double.infinity, fit: BoxFit.cover),
          Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(restaurant['name'],
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text(restaurant['description']),
                Row(children: [
                  Icon(Icons.star, color: Colors.amber),
                  Text(restaurant['rating'].toString())
                ]),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: TextField(
              decoration: InputDecoration(
                labelText: "Search Products",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (val) =>
                  ref.read(productSearchProvider.notifier).state = val,
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (_, index) {
                final p = products[index];
                return ListTile(
                  leading: Image.network(p['image'],
                      width: 60, height: 60, fit: BoxFit.cover),
                  title: Text(p['name']),
                  subtitle: Text("\$${p['price']}"),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ProductDetailsScreen(product: p),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
