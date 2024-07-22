import 'package:my_app/models/grocery_item.dart';

class CartItem{
  final Grocery grocery;
  int quantity;

  CartItem({
  required this.grocery, 
  this.quantity = 1,
  });
}