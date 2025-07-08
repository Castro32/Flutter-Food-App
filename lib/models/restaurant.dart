import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_4/models/cart_items.dart';
import 'package:intl/intl.dart';

import 'food.dart';
class Restaurant extends ChangeNotifier{
  final List<Food> _menu = [
    //burger 
    Food(
      name: 'Classic Cheeseburger', 
      description: "Juicy beef patty with melted cheddar and lettuce.", 
      imagePath: 'lib/images/burgers/burger1.png', 
      price: 320, 
      category: FoodCategory.burgers, 
      availableAddons: [
        Addon(name: "Extra Cheese", price: 320),
        Addon(name: "Bacon", price: 350),
        Addon(name: "Avacado", price: 400)
      ]
    ),
    Food(
      name: 'The Inferno Blaze', 
      description: "A juicy beef patty layered with pepper jack cheese, crispy jalapeños, smoky chipotle mayo, lettuce, and grilled onions on a toasted brioche bun.", 
      imagePath: 'lib/images/burgers/burger2.png', 
      price: 350, 
      category: FoodCategory.burgers, 
      availableAddons: [
        Addon(name: "crispy jalapeño", price: 370),
        Addon(name: "toasted brioche bun", price: 390),
        Addon(name: "smoky chipotle mayo", price: 450)
      ]
    ),
    Food(
      name: 'The Big Ranch Rodeo', 
      description: "Double beef patties, crispy bacon, cheddar cheese, onion rings, BBQ sauce, and creamy ranch dressing on a sesame seed bun.", 
      imagePath: 'lib/images/burgers/burger3.png', 
      price: 320, 
      category: FoodCategory.burgers, 
      availableAddons: [
        Addon(name: "Extra Cheese", price: 400),
        Addon(name: "Bacon", price: 420),
        Addon(name: "Avacado", price: 440)
      ]
    ),
    //salad
    Food(
      name: 'Classic Chicken Caesar Salad', 
      description: "Crisp romaine lettuce tossed with grilled chicken breast, crunchy croutons, shaved parmesan cheese, and creamy Caesar dressing.", 
      imagePath: 'lib/images/salads/salad.png', 
      price: 320, 
      category: FoodCategory.salads, 
      availableAddons: [
        Addon(name: "Extra Cheese", price: 320),
        Addon(name: "Bacon", price: 350),
        Addon(name: "Avacado", price: 400)
      ]
    ),
    Food(
      name: 'Mediterranean Delight Salad', 
      description: "A refreshing mix of cherry tomatoes, cucumbers, red onions, Kalamata olives, and feta cheese on a bed of mixed greens, drizzled with tangy lemon-oregano vinaigrette.", 
      imagePath: 'lib/images/salads/salad1.png', 
      price: 320, 
      category: FoodCategory.salads, 
      availableAddons: [
        Addon(name: "Extra Cheese", price: 320),
        Addon(name: "Bacon", price: 350),
        Addon(name: "Avacado", price: 400)
      ]
    ),
    Food(
      name: 'Tropical Quinoa Power Salad', 
      description: "Tri-color quinoa blended with baby spinach, mango chunks, avocado, black beans, and roasted sweet corn, finished with a honey-lime dressing.", 
      imagePath: 'lib/images/salads/salad2.png', 
      price: 320, 
      category: FoodCategory.salads, 
      availableAddons: [
        Addon(name: "Extra Cheese", price: 320),
        Addon(name: "Bacon", price: 350),
        Addon(name: "Avacado", price: 400)
      ]
    ),
    //drinks
    Food(
      name: 'Berry Bliss Smoothie', 
      description: "A sweet and tangy blend to energize your day.A mix of strawberries, blueberries, and raspberries blended with low-fat yogurt and a splash of honey for a creamy, antioxidant-rich treat.", 
      imagePath: 'lib/images/drinks/drink.png', 
      price: 320, 
      category: FoodCategory.drinks, 
      availableAddons: [
        Addon(name: "Extra Cold", price: 320),
        Addon(name: "Tangy", price: 350),
        Addon(name: "Sweet", price: 400)
      ]
    ),
    Food(
      name: 'Tropical Sunset Mocktail', 
      description: "Pineapple and orange juice swirled with a splash of grenadine and topped with fresh mint and a cherry — perfect for sipping under the sun", 
      imagePath: 'lib/images/drinks/drink1.png', 
      price: 320, 
      category: FoodCategory.drinks, 
      availableAddons: [
        Addon(name: "Vibrant", price: 320),
        Addon(name: "Non-Alcoholic", price: 350),
        Addon(name: "Fizzy", price: 400)
      ]
    ),
    Food(
      name: 'Iced Mint Lemonade', 
      description: "Freshly squeezed lemons shaken with crushed ice, a dash of sugar, and muddled mint leaves — the ultimate thirst-quencher.", 
      imagePath: 'lib/images/drinks/drink2.png', 
      price: 320, 
      category: FoodCategory.drinks, 
      availableAddons: [
        Addon(name: "Cool", price: 320),
        Addon(name: "Crisp", price: 350),
        Addon(name: "Refreshing", price: 400)
      ]
    ),

    //desserts
    Food(
      name: ' Grilled Halloumi & Avocado Salad', 
      description: "Golden-brown grilled halloumi paired with ripe avocado, cherry tomatoes, arugula, and cucumber, drizzled with a zesty lemon-herb dressing.", 
      imagePath: 'lib/images/desserts/dessert.png', 
      price: 320, 
      category: FoodCategory.desserts, 
      availableAddons: [
        Addon(name: "Extra Cheese", price: 320),
        Addon(name: "Bacon", price: 350),
        Addon(name: "Avacado", price: 400)
      ]
    ),
    Food(
      name: 'Spicy Thai Chicken Salad', 
      description: "Shredded grilled chicken, shredded carrots, red cabbage, chopped peanuts, and cilantro on a bed of romaine, tossed in a spicy peanut-lime dressing.", 
      imagePath: 'lib/images/desserts/dessert1.png', 
      price: 320, 
      category: FoodCategory.desserts, 
      availableAddons: [
        Addon(name: "Extra Cheese", price: 320),
        Addon(name: "Bacon", price: 350),
        Addon(name: "Avacado", price: 400)
      ]
    ),
    Food(
      name: 'Roasted Beet & Goat Cheese Salad', 
      description: "Roasted beets, crumbled goat cheese, arugula, and candied walnuts, finished with a balsamic glaze for a rich, earthy flavor.", 
      imagePath: 'lib/images/desserts/dessert2.png', 
      price: 320, 
      category: FoodCategory.desserts, 
      availableAddons: [
        Addon(name: "Extra Cheese", price: 320),
        Addon(name: "Bacon", price: 350),
        Addon(name: "Avacado", price: 400)
      ]
    ),
  ];

  //delivery address
  String _deliveryAddress = "6901, Kahawa Wendani";


  //getter1
  List<Food> get menu=>_menu;

  // operations

    //user cart
    final List<CartItems> _cart = [];
    
    //getter for cart
    List<CartItems> get cart => _cart;

    //address getter
    String get deliveryAddress => _deliveryAddress;
    
    //ad to cart
    void addToCart(Food food, List<Addon> selectedAddons){
      //check cart item already with food+quantity
      CartItems? cartItem = _cart.firstWhereOrNull((item)  {
        //check if items are ==
        bool isSameFood = item.food == food;

        //check if list of items are ==
        bool isSameAddons = const ListEquality().equals(item.selectedAddons, selectedAddons);

        return isSameFood && isSameAddons;
      });

      //item exists increase no.
      if (cartItem != null) {
        cartItem.quantity++;
      }

      //else add another
      else {
        _cart.add(CartItems(food: food, selectedAddons: selectedAddons));
      }
      notifyListeners();
    }
  //remove cart - FIXED BUG
  void removeFromCart(CartItems cartItem){
    int cartIndex = _cart.indexOf(cartItem);

    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1){
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex); // Fixed: was _cart.remove(cartIndex)
      }
    }
    notifyListeners(); // Added missing notifyListeners()
  }

  //total price
  double getTotalPrice() {
    double total = 0.0;

    for (CartItems cartItem in _cart) {
      double itemTotal = cartItem.food.price;

      for (Addon addon in cartItem.selectedAddons){
        itemTotal += addon.price;
      }

      total += itemTotal * cartItem.quantity;
    }
    return total;
  }

  //total items in cart
  int getTotalItemCount(){
    int totalItemCount = 0;

    for (CartItems cartItem in _cart){
      totalItemCount += cartItem.quantity;
    }
    return totalItemCount;
  }

  //clear
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  //update delivery address
  void updateDeliveryAddress(String newAddress) {
    _deliveryAddress = newAddress;
    notifyListeners();
  }

  //generate receipt
  String displayCartReceipt(){
    final receipt = StringBuffer();
    receipt.writeln("Here is your receipt");
    receipt.writeln();

    //date format + seconds
    String formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
    receipt.writeln(formattedDate);
    receipt.writeln();
    receipt.writeln("_________________");

    for (final cartItem in _cart){
      receipt.writeln("${cartItem.quantity} * ${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}");
      if (cartItem.selectedAddons.isNotEmpty) {
        receipt.writeln("   Add-ons: ${_formatAddons(cartItem.selectedAddons)}");
      }
      receipt.writeln();
    }

    receipt.writeln("______________");
    receipt.writeln();
    receipt.writeln("Total Items: ${getTotalItemCount()}");
    receipt.writeln("Total Price: ${_formatPrice(getTotalPrice())}");
    receipt.writeln();
    receipt.writeln("Delivery Address: $_deliveryAddress");

    return receipt.toString();
  }

  //format double value into money
  String _formatPrice(double price) {
    return "Ksh${price.toStringAsFixed(2)}";
  }

  //addon list to string summary
  String _formatAddons(List<Addon> addons){
    return addons.map((addon) => "Ksh${addon.name}  (${_formatPrice(addon.price)})").join(", ");
  }


}