import 'package:flutter/material.dart';
import 'package:flutter_application_4/models/cart_items.dart';
import 'package:flutter_application_4/models/restaurant.dart';
import 'package:provider/provider.dart';

class CartTile extends StatelessWidget {
  final CartItems cartItem;

  const CartTile({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant> (builder: (context, restaurant, child) => Container(
      child: Column(
        children: [
          Row(
            children: [
              //image
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  cartItem.food.imagePath,
                  height: 100,
                  width: 100,
                  ),
              ),

              const SizedBox(width: 10),
              //price and name
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //name
                  Text(cartItem.food.name),

                  //price
                  Text('Ksh ${cartItem.food.price.toString()}',)
                ],
              )
              //+ or -
            ],
          )
        ],
      ),
    ));
  }
}