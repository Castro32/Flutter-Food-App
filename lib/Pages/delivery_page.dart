import 'package:flutter/material.dart';
import 'package:flutter_application_4/components/receipt_component.dart';

class DeliveryPage extends StatelessWidget {
  const DeliveryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Delivery Progress"),
        backgroundColor:  Colors.transparent,
      ),
      bottomNavigationBar: _buildBottomNavbar(context),
      body: const Column(
        children: [
          ReceiptComponent(),
        ],
      )
    );
  }

  //custom navbar
  Widget _buildBottomNavbar(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.secondary,
      borderRadius: const BorderRadius.only(topLeft:Radius.circular(40),
      topRight:Radius.circular(40),
       )
      ),
      padding: const EdgeInsets.all(25),
      child: Row(
        children: [
          //driver profile
          Container(decoration: BoxDecoration(color: Theme.of(context).colorScheme.surface,
          shape: BoxShape.circle,
          ),
          child: IconButton(
            onPressed: (){},
            icon: const Icon(Icons.person),
          ),
          ),

          const SizedBox(width: 10,),

          //driver details
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text("Kevin Wepukhulu", 
            style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Theme.of(context).colorScheme.inversePrimary),
            ),
            Text("Driver",
            style: TextStyle(
            color: Theme.of(context).colorScheme.primary),),
          ],
          ),

          const Spacer(),

          //message driver button
          Row(children: [
            Container(decoration: BoxDecoration(color: Theme.of(context).colorScheme.surface,
          shape: BoxShape.circle,
          ),
          child: IconButton(
            onPressed: (){},
            icon: const Icon(Icons.message),
          ),
          ),

          const SizedBox(width: 10,),
          ],),

          //call
          Container(decoration: BoxDecoration(color: Theme.of(context).colorScheme.surface,
          shape: BoxShape.circle,
          ),
          child: IconButton(
            onPressed: (){},
            icon: const Icon(Icons.call),
            color: Colors.green,
          ),
          ),

          const SizedBox(width: 10,),
        ],
      ),
    );
  }
}