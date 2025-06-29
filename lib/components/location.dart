import 'package:flutter/material.dart';

class CurrentLocation extends StatelessWidget{
  const CurrentLocation({super.key});

  void openLocationSearchBox(BuildContext context){
    showDialog(context: context, builder: (context) => AlertDialog(
      title: const Text("Your Location"),
      content: const TextField(decoration: InputDecoration(hintText:"Search Address"),
      ),
      actions: [
        //cancel btn
        MaterialButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Cancel"),
        ),
        //save btn
        MaterialButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Save"),
        )
      ],
    ));
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
                Text("6901,   Kahawa Wendani", style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary, fontWeight: FontWeight.bold)),
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