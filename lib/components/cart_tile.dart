import 'package:flutter/material.dart';
import 'package:flutter_application_4/components/cart_quantity.dart';
import 'package:flutter_application_4/models/cart_items.dart';
import 'package:flutter_application_4/models/restaurant.dart';
import 'package:provider/provider.dart';

class CartTile extends StatelessWidget {
  final CartItems cartItem;

  const CartTile({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant> (builder: (context, restaurant, child) => Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.tertiary,
        borderRadius: BorderRadius.circular(8)
      ),
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                ),
            
                const Spacer(),
                //+ or - cart
                CartQuantity(quantity: cartItem.quantity, food: cartItem.food, 
                onIncrement: (){
                  restaurant.addToCart(cartItem.food, cartItem.selectedAddons);
                },
                onDecrement: (){
                  restaurant.removeFromCart(cartItem);
                }
                )
              ],
            ),
          ),

          //addons
          SizedBox(
            height: cartItem.selectedAddons.isEmpty ? 0: 60,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 10, bottom: 10, right: 10),
              children: cartItem.selectedAddons.map((addon) => Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: FilterChip(
                  label: Row(
                    children: [
                      //addon name
                      Text(addon.name),
                
                      const Padding(padding: EdgeInsets.only(left: 3.0)),
                      //addon price
                      Text('(Ksh ${addon.price.toStringAsFixed(2)})',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary
                      ),
                      ),
                    ],
                  ),
                  shape: StadiumBorder(
                    side: BorderSide(
                      color: Theme.of(context).colorScheme.primary
                    )
                  ),
                  onSelected: (value) {},
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    labelStyle: TextStyle(color: Theme.of(context).colorScheme.inversePrimary,
                    fontSize: 12,
                    ),
                ),
              )).toList(),
            ),
          )
        ],
      ),
    ));
  }
}