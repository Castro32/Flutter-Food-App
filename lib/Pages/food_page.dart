import 'package:flutter/material.dart';
import 'package:flutter_application_4/components/my_button.dart';
import 'package:flutter_application_4/models/food.dart';
import 'package:flutter_application_4/models/restaurant.dart';
import 'package:provider/provider.dart';

class FoodPage extends StatefulWidget {
  final Food food;
  final Map<Addon, bool> selectedAddons = {};

  FoodPage({super.key, required this.food}){

    for (Addon addon in food.availableAddons){
      selectedAddons[addon]= false;
    }
  }

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {

  //method to add to cart
  void addToCart(Food food, Map<Addon, bool> selectedAddons){

    //close food page
    Navigator.pop(context);

    List<Addon> currentlySelectedAddons = [];
    for (Addon addon in widget.food.availableAddons) {
      if (widget.selectedAddons[addon] == true){
        currentlySelectedAddons.add(addon);
      }
    }

    context.read<Restaurant>().addToCart(food, currentlySelectedAddons);
  }
  @override
  Widget build(BuildContext context) {
    return Stack( children: [
      //scaffold
      Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //food image
            Image.asset(widget.food.imagePath),
        
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //food name
              Text(widget.food.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
        
              //food price
              Text('Ksh ${widget.food.price}', style: TextStyle( fontSize: 16, color: Theme.of(context).colorScheme.secondary),),
        
              const SizedBox(height: 10,),
              
              //food description
              Text(widget.food.description),
              const SizedBox(height: 10,),
        
              Divider(color: Theme.of(context).colorScheme.secondary,),
             
              
              //addons
        
               Text("Add- ons", style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary, fontSize: 16, fontWeight: FontWeight.bold),),
        
              const SizedBox(height: 10,),
              Container(
                decoration: BoxDecoration(border: Border.all(color: Theme.of(context).colorScheme.tertiary, ),
                borderRadius: BorderRadius.circular(8),
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemCount: widget.food.availableAddons.length,
                  itemBuilder: (context,index){
                    //individual addon
                    Addon addon = widget.food.availableAddons[index];
                  return CheckboxListTile(
                    title: Text(addon.name),
                    subtitle: Text('Ksh ${addon.price}', style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),),
                    value: widget.selectedAddons[addon],
                    onChanged: (bool? value){
                      setState(() {
                        widget.selectedAddons[addon] = value!;
                      });
                    }
                  );
                }),
              )
                ],
              ),
            ),
        
            //add to cart button
           MyButton(
            onTap: ()=> addToCart(widget.food, widget.selectedAddons), 
            text: "Add to Cart",
            ),

            const SizedBox(height: 25)
            
          ],
        ),
      ),
    ),
    //back button
    // Container(decoration: BoxDecoration(color: Theme.of(context).colorScheme.secondary),
    // child: IconButton(
    //   icon: Icon(Icons.arrow_back_ios_rounded),
    //   onPressed: () {
    //     Navigator.of(context).pop();
    //   },
    // ),
    // )
    SafeArea(
      child: Opacity (
        opacity: 0.5,
        child: Container(
          margin: const EdgeInsets.only(left: 10),
          decoration: BoxDecoration(color: Theme.of(context).colorScheme.secondary, shape: BoxShape.circle,),
        child: IconButton(
        icon: const Icon(Icons.arrow_back_ios_rounded),
        onPressed: () {
          Navigator.of(context).pop();
        },
            ),
            ),
      )
    )
    ],
    );
  }
}