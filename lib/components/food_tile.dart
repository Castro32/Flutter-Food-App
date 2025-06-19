// import 'package:flutter/material.dart';
// import '../models/food.dart';

// class FoodTile extends StatelessWidget {

//   final Food food;
//   final void Function()? onTap;
//   const FoodTile({super.key, required this.food, required this.onTap});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         GestureDetector(
//           onTap: onTap,
//           child: Padding(
//             padding: const EdgeInsets.all(15.0),
//             child: Row(
//               children: [
//                 Expanded(child:Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
            
//                     //food details
//                     Text(food.name),
//                     Text(
//                       '\Ksh' + food.price.toString(),
//                      style: TextStyle(
//                       color: Theme.of(context).colorScheme.inversePrimary,
//                       fontWeight: FontWeight.bold,
//                     ),
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     Text(food.description, style: TextStyle(
//                       color:Theme.of(context). colorScheme.inversePrimary,)),
            
//                   ],
//                 )),
                
//                     //food image
//                     Image.asset(food.imagePath, height:100 ,)
            
//               ],
//             ),
//           ),
//         )
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import '../models/food.dart';

class FoodTile extends StatelessWidget {
  final Food food;
  final void Function()? onTap;

  const FoodTile({super.key, required this.food, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              // Food image
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  food.imagePath,
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 15),
              // Food details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      food.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Ksh ${food.price.toString()}',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      food.description,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
