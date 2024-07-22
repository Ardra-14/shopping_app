part of 'cart_bloc.dart';

@immutable
class CartState extends Equatable{

  final List<CartItem> items;

CartState({this.items = const []});

@override
  List<Object?> get props => [items];

}


