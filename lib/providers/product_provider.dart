import 'package:flutter_riverpod/flutter_riverpod.dart';

final productListProvider = Provider<List<Map<String, dynamic>>>((ref) {
  return [
    {
      "restaurant": "The Pizza Place",
      "name": "Margherita Pizza",
      "price": 8.99,
      "image":
          "https://images.unsplash.com/photo-1574071318508-1cdbab80d002?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGl6emElMjBtYXJnaGVyaXRhfGVufDB8fDB8fHww",
      "description": "Tomato, mozzarella, basil.",
    },
    {
      "restaurant": "Burger Town",
      "name": "Cheeseburger",
      "price": 6.49,
      "image":
          "https://images.unsplash.com/photo-1550547660-d9450f859349?w=600",
      "description": "Grilled beef with cheese.",
    },
    {
      "restaurant": "Sushi World",
      "name": "California Roll",
      "price": 10.99,
      "image":
          "https://images.unsplash.com/photo-1559410545-0bdcd187e0a6?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Y2FsaWZvcm5pYSUyMHJvbGx8ZW58MHx8MHx8fDA%3D",
      "description": "Crab, avocado, cucumber.",
    },
  ];
});

final productSearchProvider = StateProvider<String>((ref) => '');

final filteredProductsProvider =
    Provider.family<List<Map<String, dynamic>>, String>((ref, restaurantName) {
  final search = ref.watch(productSearchProvider).toLowerCase();
  final all = ref.watch(productListProvider);
  return all
      .where((p) =>
          p['restaurant'] == restaurantName &&
          p['name'].toLowerCase().contains(search))
      .toList();
});
