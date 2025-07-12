import 'package:flutter_riverpod/flutter_riverpod.dart';

final productListProvider = Provider<List<Map<String, dynamic>>>((ref) {
  return [
    // The Pizza Place
    {
      "restaurant": "The Pizza Place",
      "name": "Margherita Pizza",
      "price": 8.99,
      "image":
          "https://images.unsplash.com/photo-1574071318508-1cdbab80d002?fm=jpg&q=60&w=3000",
      "description": "Tomato, mozzarella, basil.",
    },
    {
      "restaurant": "The Pizza Place",
      "name": "Pepperoni Pizza",
      "price": 9.99,
      "image":
          "https://images.unsplash.com/photo-1628840042765-356cda07504e?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGVwcGVyb25pJTIwcGl6emF8ZW58MHx8MHx8fDA%3D",
      "description": "Pepperoni, mozzarella, tomato sauce.",
    },
    {
      "restaurant": "The Pizza Place",
      "name": "Veggie Supreme",
      "price": 10.49,
      "image":
          "https://images.unsplash.com/photo-1617470703128-26a0fc9af10f?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fHZlZ2dpZSUyMHBpenphfGVufDB8fDB8fHww",
      "description": "Bell peppers, mushrooms, olives, onions.",
    },

    // Burger Town
    {
      "restaurant": "Burger Town",
      "name": "Cheeseburger",
      "price": 6.49,
      "image":
          "https://plus.unsplash.com/premium_photo-1675283476222-6a1a01d6a0ba?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8YmFjb24lMjBidXJnZXJ8ZW58MHx8MHx8fDA%3D",
      "description": "Grilled beef with cheese.",
    },
    {
      "restaurant": "Burger Town",
      "name": "Bacon Double",
      "price": 7.99,
      "image":
          "https://images.unsplash.com/photo-1561758033-f8ff74d6494a?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDI2fHx8ZW58MHx8fHx8",
      "description": "Two beef patties, bacon, cheddar cheese.",
    },
    {
      "restaurant": "Burger Town",
      "name": "Chicken Burger",
      "price": 6.99,
      "image":
          "https://images.unsplash.com/photo-1551782450-a2132b4ba21d?fm=jpg&q=60&w=3000",
      "description": "Grilled chicken breast, lettuce, tomato.",
    },

    // Sushi World
    {
      "restaurant": "Sushi World",
      "name": "California Roll",
      "price": 10.99,
      "image":
          "https://images.unsplash.com/photo-1559410545-0bdcd187e0a6?fm=jpg&q=60&w=3000",
      "description": "Crab, avocado, cucumber.",
    },
    {
      "restaurant": "Sushi World",
      "name": "Salmon Nigiri",
      "price": 12.49,
      "image":
          "https://images.unsplash.com/photo-1744360515510-db7bf0f6def8?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8c2FsbW9uJTIwc3VzaGl8ZW58MHx8MHx8fDA%3D",
      "description": "Fresh salmon over rice.",
    },
    {
      "restaurant": "Sushi World",
      "name": "Tempura Roll",
      "price": 11.99,
      "image":
          "https://townsquare.media/site/12/files/2021/09/attachment-mahmoud-fawzy-EqoCUzG9200-unsplash-1.jpg",
      "description": "Shrimp tempura, avocado, spicy mayo.",
    }
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
