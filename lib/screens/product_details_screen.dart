import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/basket_provider.dart';
import '../screens/checkout_screen.dart';
import '../widgets/quantity_selector.dart';
import '../widgets/common_app_bar.dart';

class ProductDetailsScreen extends ConsumerStatefulWidget {
  final Map<String, dynamic> product;

  ProductDetailsScreen({required this.product});

  @override
  ConsumerState<ProductDetailsScreen> createState() =>
      _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends ConsumerState<ProductDetailsScreen> {
  int quantity = 1;

  void _increase() => setState(() => quantity++);
  void _decrease() =>
      setState(() => quantity = quantity > 1 ? quantity - 1 : 1);

  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    final basketCount = ref.watch(basketProvider).length;

    return Scaffold(
      appBar: CommonAppBar(title: "Product Details"),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Image.network(
              product['image'],
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16),
            Text(product['name'],
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(product['description']),
            SizedBox(height: 8),
            Text("Price: \$${product['price']}",
                style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            QuantitySelector(
              quantity: quantity,
              onIncrease: _increase,
              onDecrease: _decrease,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ref
                    .read(basketProvider.notifier)
                    .addToBasket(product, quantity);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content:
                      Text("${product['name']} x$quantity added to basket!"),
                ));
              },
              child: Text("Add to Basket"),
            )
          ],
        ),
      ),
    );
  }
}
