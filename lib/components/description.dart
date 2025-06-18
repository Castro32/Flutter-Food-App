import 'package:flutter/material.dart';

class MyDescriptionBox extends StatelessWidget {
  const MyDescriptionBox({super.key});

  @override
  Widget build(BuildContext context) {

    //textstyle
    var myPrimaryTextStyle = TextStyle(
      color: Theme.of(context).colorScheme.inversePrimary,
      //fontWeight: FontWeight.bold,
    );
    var mySecondaryTextStyle = TextStyle(
      color: Theme.of(context).colorScheme.inversePrimary,
      fontWeight: FontWeight.bold,
    );
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.secondary),
        borderRadius: BorderRadius.circular(25),
      ),
      padding: const EdgeInsets.all(25),
      margin: const EdgeInsets.only(left:25, right: 25, bottom: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //delivery free
          Column(
            children: [
              Text("Ksh 300", style: myPrimaryTextStyle,),
              Text("Delivery Fee", style: mySecondaryTextStyle,)
            ],
          ),
          //delivery time
          Column(
            children: [
              Text("15-30 Min", style: myPrimaryTextStyle,),
              Text("Delivery Time", style: mySecondaryTextStyle,)
            ],
          )

        ],
      ),
    );
  }
}
