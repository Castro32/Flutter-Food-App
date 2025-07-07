import 'package:flutter/material.dart';
import 'package:flutter_application_4/models/restaurant.dart';
import 'package:provider/provider.dart';

class CurrentLocation extends StatelessWidget{
  const CurrentLocation({super.key});

  void openLocationSearchBox(BuildContext context){
    final TextEditingController textController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Your Location"),
        content: TextField(
          controller: textController,
          decoration: const InputDecoration(hintText: "Enter your address..."),
        ),
        actions: [
          //cancel btn
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          //save btn
          MaterialButton(
            onPressed: () {
              String newAddress = textController.text;
              context.read<Restaurant>().updateDeliveryAddress(newAddress);
              Navigator.pop(context);
            },
            child: const Text("Save"),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context){
    return Padding(

      padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment:CrossAxisAlignment.start ,
        children: [
          Text("Deliver now", style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary)),
          GestureDetector(
            onTap: () => openLocationSearchBox(context),
            child: Row(
              children: [
                //address
                Consumer<Restaurant>(
                  builder: (context, restaurant, child) {
                    return Text(
                      restaurant.deliveryAddress.isEmpty
                          ? "Enter your address"
                          : restaurant.deliveryAddress,
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    );
                  },
                ),
                //menu
                const Icon(Icons.keyboard_arrow_down_rounded)
              ],
            ),
          )
        ],
      ),
    );
  }
}