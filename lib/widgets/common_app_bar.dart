import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/basket_provider.dart';
import '../screens/checkout_screen.dart';

class CommonAppBar extends ConsumerWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? extraActions;
  final bool showBack;

  const CommonAppBar({
    required this.title,
    this.extraActions,
    this.showBack = true,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final basket = ref.watch(basketProvider);

    return AppBar(
      leading: showBack ? null : SizedBox.shrink(),
      title: Text(title),
      actions: [
        ...?extraActions,
        Stack(
          children: [
            IconButton(
              icon: Icon(Icons.shopping_basket),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => CheckoutScreen()),
                );
              },
            ),
            if (basket.isNotEmpty)
              Positioned(
                right: 6,
                top: 6,
                child: CircleAvatar(
                  radius: 9,
                  backgroundColor: Colors.red,
                  child: Text(
                    basket.length.toString(),
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
