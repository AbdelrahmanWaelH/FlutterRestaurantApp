import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/basket_provider.dart';
import '../screens/restaurant_list_screen.dart';

class CheckoutScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final basket = ref.watch(basketProvider);
    final total = basket.fold(
        0.0, (sum, item) => sum + item.product['price'] * item.quantity);

    return Scaffold(
      appBar: AppBar(title: Text("Checkout")),
      body: basket.isEmpty
          ? Center(child: Text("Your basket is empty"))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: basket.length,
                    itemBuilder: (_, index) {
                      final item = basket[index];
                      return ListTile(
                        leading: Image.network(item.product['image'],
                            width: 60, fit: BoxFit.cover),
                        title: Text(item.product['name']),
                        subtitle: Text(
                            "x${item.quantity} • \$${item.product['price']}"),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () => ref
                              .read(basketProvider.notifier)
                              .removeFromBasket(item.product['name']),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text("Total: \$${total.toStringAsFixed(2)}",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      SizedBox(height: 12),
                      ElevatedButton(
                        onPressed: () {
                          ref.read(basketProvider.notifier).clearBasket();

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Order placed!")),
                          );

                          // Replace all previous screens with Restaurant List
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (_) => RestaurantListScreen()),
                            (route) => false,
                          );
                        },
                        child: Text("Place Order"),
                      )
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
