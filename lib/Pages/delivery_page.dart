import 'package:flutter/material.dart';
import 'package:flutter_application_4/components/receipt_component.dart';
import 'package:flutter_application_4/models/restaurant.dart';
import 'package:flutter_application_4/services/database/firestore.dart';
import 'package:provider/provider.dart';

class DeliveryPage extends StatefulWidget {
  const DeliveryPage({super.key});

  @override
  State<DeliveryPage> createState() => _DeliveryPageState();
}

class _DeliveryPageState extends State<DeliveryPage> {
  //db access
  FirestoreService db = FirestoreService();
  @override
  void initState() {
    super.initState();

    //save order to db
    String receipt = context.read<Restaurant>().displayCartReceipt();
    db.saveOrder(receipt).then((value) {
      //show snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Order saved successfully!"),
          duration: Duration(seconds: 2),
        ),
      );
    }).catchError((error) {
      //show snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error saving order: $error"),
          duration: const Duration(seconds: 2),
        ),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: const Text("Delivery Progress"),
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