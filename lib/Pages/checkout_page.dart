import 'package:flutter/material.dart';
import 'package:flutter_application_4/components/my_button.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_application_4/Pages/delivery_page.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String cardNumber = '';
  String cardHolderName= '';
  String expiryDate = '';
  String cvvCode = '';
  bool isCvvFocused = false;

  //pay button function
  void onClick(){
    if (formKey.currentState!.validate()){
      showDialog(context: context, 
      builder: (context)=> AlertDialog(
        title: const Text("Confirm Payment"),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              Text('Card Number: $cardNumber ' ),
              Text('Expiry Date: $expiryDate ' ),
              Text('Card Holder Name: $cardHolderName ' ),
              Text('cvv: $cvvCode ' )
            ],
          ),
        ),
        actions: [
          //cancel
          TextButton(
            onPressed: ()=>Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          //confirm
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DeliveryPage(),
                ),
              );
            },
            child: const Text("Yes"),
          )
        ],
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.primary,
        title: const Text("Checkout"),
      ),
      body: Column(
        children: [
          //card details
          CreditCardWidget(
            cardNumber: cardNumber, 
            expiryDate: expiryDate, 
            cardHolderName: cardHolderName, 
            cvvCode: cvvCode, 
            showBackView: isCvvFocused, onCreditCardWidgetChange: (p0){}),

            //credit card form
          CreditCardForm(
            cardNumber: cardNumber, 
            expiryDate: expiryDate, 
            cardHolderName: cardHolderName, 
            cvvCode: cvvCode, 
            onCreditCardModelChange: (data){
              setState(() {
                cardNumber = data.cardNumber;
                expiryDate = data.expiryDate;
                cardHolderName = data.cardHolderName;
                cvvCode = data.cvvCode;
              });
            }, 
            formKey: formKey),

            const Spacer(),

            MyButton(text: 'Pay Now',
             onTap: onClick,
             ),

            const SizedBox(height: 25),
        ],
      ),
    );
  }
}