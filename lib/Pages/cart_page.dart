// // import 'package:flutter/material.dart';
// // import 'package:flutter_application_4/models/restaurant.dart';
// // import 'package:provider/provider.dart';

// // class CartPage extends StatelessWidget {
// //   const CartPage({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Consumer<Restaurant>(builder: (context, restaurant, child) {
// //       //cart
// //       final userCart = restaurant.cart;

// //       //scaffold UI
// //       return Scaffold(
// //         appBar: AppBar(
// //           title: Text("Cart"),
// //         ),
// //       );
// //     });
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:flutter_application_4/models/restaurant.dart';
// import 'package:flutter_application_4/models/cart_items.dart';
// import 'package:provider/provider.dart';

// class CartPage extends StatelessWidget {
//   const CartPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<Restaurant>(builder: (context, restaurant, child) {
//       //cart
//       final userCart = restaurant.cart;

//       //scaffold UI
//       return Scaffold(
//         appBar: AppBar(
//           title: const Text("Cart"),
//           backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//           actions: [
//             if (userCart.isNotEmpty)
//               IconButton(
//                 onPressed: () {
//                   showDialog(
//                     context: context,
//                     builder: (context) => AlertDialog(
//                       title: const Text("Clear Cart"),
//                       content: const Text("Are you sure you want to clear your cart?"),
//                       actions: [
//                         TextButton(
//                           onPressed: () => Navigator.pop(context),
//                           child: const Text("Cancel"),
//                         ),
//                         TextButton(
//                           onPressed: () {
//                             restaurant.clearCart();
//                             Navigator.pop(context);
//                           },
//                           child: const Text("Clear"),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//                 icon: const Icon(Icons.delete_outline),
//               ),
//           ],
//         ),
//         body: Column(
//           children: [
//             // Cart Items List
//             Expanded(
//               child: userCart.isEmpty
//                   ? const Center(
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Icon(
//                             Icons.shopping_cart_outlined,
//                             size: 80,
//                             color: Colors.grey,
//                           ),
//                           SizedBox(height: 16),
//                           Text(
//                             "Your cart is empty",
//                             style: TextStyle(
//                               fontSize: 18,
//                               color: Colors.grey,
//                             ),
//                           ),
//                           SizedBox(height: 8),
//                           Text(
//                             "Add some delicious items to get started!",
//                             style: TextStyle(
//                               fontSize: 14,
//                               color: Colors.grey,
//                             ),
//                           ),
//                         ],
//                       ),
//                     )
//                   : ListView.builder(
//                       padding: const EdgeInsets.all(16),
//                       itemCount: userCart.length,
//                       itemBuilder: (context, index) {
//                         final cartItem = userCart[index];
//                         return _buildCartItem(context, cartItem, restaurant);
//                       },
//                     ),
//             ),
            
//             // Bottom Summary
//             if (userCart.isNotEmpty)
//               Container(
//                 padding: const EdgeInsets.all(16),
//                 decoration: BoxDecoration(
//                   color: Theme.of(context).colorScheme.surface,
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.1),
//                       blurRadius: 10,
//                       offset: const Offset(0, -2),
//                     ),
//                   ],
//                 ),
//                 child: Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           "Total Items: ${restaurant.getTotalItemCount()}",
//                           style: const TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                         Text(
//                           "KSh ${restaurant.getTotalPrice().toStringAsFixed(2)}",
//                           style: const TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.green,
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 16),
//                     SizedBox(
//                       width: double.infinity,
//                       child: ElevatedButton(
//                         onPressed: () {
//                           // Navigate to checkout or handle order
//                           _showCheckoutDialog(context, restaurant);
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Theme.of(context).primaryColor,
//                           foregroundColor: Colors.white,
//                           padding: const EdgeInsets.symmetric(vertical: 16),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                         ),
//                         child: const Text(
//                           "Proceed to Checkout",
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//           ],
//         ),
//       );
//     });
//   }

//   Widget _buildCartItem(BuildContext context, CartItems cartItem, Restaurant restaurant) {
//     return Card(
//       margin: const EdgeInsets.only(bottom: 12),
//       child: Padding(
//         padding: const EdgeInsets.all(12),
//         child: Row(
//           children: [
//             // Food Image
//             ClipRRect(
//               borderRadius: BorderRadius.circular(8),
//               child: Image.asset(
//                 cartItem.food.imagePath,
//                 width: 60,
//                 height: 60,
//                 fit: BoxFit.cover,
//                 errorBuilder: (context, error, stackTrace) {
//                   return Container(
//                     width: 60,
//                     height: 60,
//                     color: Colors.grey[300],
//                     child: const Icon(Icons.restaurant, color: Colors.grey),
//                   );
//                 },
//               ),
//             ),
//             const SizedBox(width: 12),
            
//             // Item Details
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     cartItem.food.name,
//                     style: const TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 4),
//                   if (cartItem.selectedAddons.isNotEmpty)
//                     Text(
//                       "Add-ons: ${cartItem.selectedAddons.map((addon) => addon.name).join(', ')}",
//                       style: TextStyle(
//                         fontSize: 12,
//                         color: Colors.grey[600],
//                       ),
//                     ),
//                   const SizedBox(height: 4),
//                   Text(
//                     "KSh ${_getItemTotalPrice(cartItem).toStringAsFixed(2)}",
//                     style: const TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.green,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
            
//             // Quantity Controls
//             Row(
//               children: [
//                 IconButton(
//                   onPressed: () => restaurant.removeFromCart(cartItem),
//                   icon: const Icon(Icons.remove_circle_outline),
//                   color: Colors.red,
//                 ),
//                 Text(
//                   cartItem.quantity.toString(),
//                   style: const TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 IconButton(
//                   onPressed: () => restaurant.addToCart(cartItem.food, cartItem.selectedAddons),
//                   icon: const Icon(Icons.add_circle_outline),
//                   color: Colors.green,
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   double _getItemTotalPrice(CartItems cartItem) {
//     double total = cartItem.food.price;
//     for (var addon in cartItem.selectedAddons) {
//       total += addon.price;
//     }
//     return total;
//   }

//   void _showCheckoutDialog(BuildContext context, Restaurant restaurant) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text("Order Summary"),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Text("Total Items: ${restaurant.getTotalItemCount()}"),
//             Text("Total Amount: KSh ${restaurant.getTotalPrice().toStringAsFixed(2)}"),
//             const SizedBox(height: 16),
//             const Text("Thank you for your order!"),
//           ],
//         ),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text("Continue Shopping"),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               restaurant.clearCart();
//               Navigator.pop(context);
//               ScaffoldMessenger.of(context).showSnackBar(
//                 const SnackBar(
//                   content: Text("Order placed successfully!"),
//                   backgroundColor: Colors.green,
//                 ),
//               );
//             },
//             child: const Text("Place Order"),
//           ),
//         ],
//       ),
//     );
//   }
// }

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