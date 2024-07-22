import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:my_app/models/cart_item.dart';
import 'package:my_app/models/grocery_item.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState()) {
   
    on<RemoveFromCart>(_onRemoveFromCart);
  }



void _onRemoveFromCart(RemoveFromCart event, Emitter<CartState> emit) async{
  final updatedItems = state.items.where((item)=>item.grocery.id != event.grocery.id).toList();
  emit(CartState(items: updatedItems));

}
}