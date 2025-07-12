import 'package:flutter_riverpod/flutter_riverpod.dart';

final restaurantListProvider = Provider<List<Map<String, dynamic>>>((ref) {
  return [
    {
      "name": "The Pizza Place",
      "description": "Authentic Italian pizza.",
      "image":
          "https://images.unsplash.com/photo-1600891964599-f61ba0e24092?w=600",
      "rating": 4.5,
    },
    {
      "name": "Burger Town",
      "description": "Big juicy burgers.",
      "image":
          "https://images.unsplash.com/photo-1550547660-d9450f859349?w=600",
      "rating": 4.2,
    },
    {
      "name": "Sushi World",
      "description": "Fresh sushi daily.",
      "image":
          "https://images.unsplash.com/photo-1663334038419-71e6f82e333f?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c3VzaGklMjBwbGF0dGVyfGVufDB8fDB8fHww",
      "rating": 4.8,
    },
  ];
});

final restaurantSearchProvider = StateProvider<String>((ref) => '');

final filteredRestaurantsProvider = Provider<List<Map<String, dynamic>>>((ref) {
  final search = ref.watch(restaurantSearchProvider).toLowerCase();
  final all = ref.watch(restaurantListProvider);
  return all.where((r) => r['name'].toLowerCase().contains(search)).toList();
});
