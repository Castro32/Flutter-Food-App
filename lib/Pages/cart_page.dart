import 'package:flutter/material.dart';
import 'package:flutter_application_4/Pages/checkout_page.dart';
import 'package:flutter_application_4/components/cart_tile.dart';
import 'package:flutter_application_4/models/restaurant.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_4/components/my_button.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant> (
      builder : (context, restaurant, child){
        //cart
        final userCart= restaurant.cart;

        //scaffold
        return Scaffold(
          appBar: AppBar(
            title: const Text('Cart'),
            backgroundColor: Colors.transparent,
            foregroundColor: Theme.of(context).colorScheme.inversePrimary,
            actions: [
              //clear cart
              IconButton(onPressed: (){
                showDialog(context: context, builder: (context) => AlertDialog(
                  title:const Text("Are you sure you want to clear the cart?"),
                  actions: [
                    //cancel button
                    TextButton(onPressed: ()=> Navigator.pop(context), child:const Text("Cancel")),

                    //yes button
                    TextButton(onPressed: (){
                      Navigator.pop(context);
                      restaurant.clearCart();
                    }, child:const Text("Yes")),
                  ],
                ));
              }, icon: const Icon(Icons.delete))
            ],
          ),
          body: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    userCart.isEmpty? const Expanded(child: Center(child:  Text("Cart is empty"))): Expanded(child: ListView.builder(
                      itemCount: userCart.length,
                      itemBuilder: (context, index) {
                
                        //get cart items
                        final cartItem = userCart[index];
                        //return cart tile ui
                        return CartTile(cartItem: cartItem);
                      }
                    ),
                    ),
                  ],
                ),
              ),
              
            //checkout button
            MyButton(onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const CheckoutPage()));
            }, text: "Checkout",),

            const SizedBox(height: 55)
            ],

          ),
        );
      }
    );
  }
}