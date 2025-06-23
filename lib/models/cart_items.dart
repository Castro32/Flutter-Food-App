// Update the import path below if 'food.dart' is in a different location, for example:
import 'food.dart';

class CartItems {
  Food food;
  List<Addon> selectedAddons;
  int quantity;
  
  CartItems({required this.food, required this.selectedAddons, this.quantity = 1});

  double get totalPrice{
    double addonsPrice = selectedAddons.fold(0, (sum, addon) => sum + addon.price);
    return (food.price + addonsPrice) * quantity;
  }
}