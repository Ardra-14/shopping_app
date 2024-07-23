part of 'cart_bloc.dart';

@immutable
class CartEvent extends Equatable{
  CartEvent();
  @override
  List <Object> get props => [];
}

class AddToCart extends CartEvent{
  final Grocery grocery;

  AddToCart({required this.grocery});

  List <Object> get props => [grocery];
}

class RemoveFromCart extends CartEvent{
  final Grocery grocery;
  RemoveFromCart({required this.grocery});

  @override
  List<Object> get props => [grocery];
}

class IncreaseQuantity extends CartEvent{
  final Grocery grocery;
  IncreaseQuantity({required this.grocery});

  @override
  List<Object> get props => [grocery];
}

class DecreaseQuantity extends CartEvent{
  final Grocery grocery;
  DecreaseQuantity({required this.grocery});

  @override
  List<Object> get props => [grocery];
}