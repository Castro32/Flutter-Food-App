import 'package:flutter/material.dart';
import 'package:flutter_application_4/Pages/cart_page.dart';

class Navbar extends StatelessWidget {
  final Widget child;
  final Widget title;

  const Navbar({
    required this.child,
    required this.title,
  super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 340.0,
      collapsedHeight: 120, 
      floating: false,
      pinned: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.shopping_cart),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) =>const CartPage() ));
          },
        ),
      ],
      backgroundColor: Theme.of(context).colorScheme.surface,
      foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: const Text("Sunrise Diner"),
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.only(bottom: 50.0),
          child: child,
        ),
        title: title,
        centerTitle: true,
        titlePadding: const EdgeInsets.only( left: 10, right: 0, top: 0),
        expandedTitleScale: 1,
      ),
    );
  }
}