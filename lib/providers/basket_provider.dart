import 'package:flutter_riverpod/flutter_riverpod.dart';

class BasketItem {
  final Map<String, dynamic> product;
  int quantity;

  BasketItem({required this.product, required this.quantity});
}

final basketProvider = StateNotifierProvider<BasketNotifier, List<BasketItem>>(
  (ref) => BasketNotifier(),
);

class BasketNotifier extends StateNotifier<List<BasketItem>> {
  BasketNotifier() : super([]);

  void addToBasket(Map<String, dynamic> product, int quantity) {
    final index =
        state.indexWhere((item) => item.product['name'] == product['name']);
    if (index != -1) {
      state[index].quantity += quantity;
      state = [...state]; // trigger rebuild
    } else {
      state = [...state, BasketItem(product: product, quantity: quantity)];
    }
  }

  void removeFromBasket(String productName) {
    state = state.where((item) => item.product['name'] != productName).toList();
  }

  void clearBasket() => state = [];
}
