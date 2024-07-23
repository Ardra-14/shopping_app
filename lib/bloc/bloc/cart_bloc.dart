import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:my_app/models/cart_item.dart';
import 'package:my_app/models/grocery_item.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState()) {
    on<AddToCart>(_onAddToCart);
    on<RemoveFromCart>(_onRemoveFromCart);
    on<IncreaseQuantity>(_onIncreaseQuantity);
    on<DecreaseQuantity>(_onDecreaseQuantity);
  }

  void _onAddToCart(AddToCart event, Emitter<CartState> emit) {
    final index =
        state.items.indexWhere((item) => item.grocery.id == event.grocery.id);
    if (index >= 0) {
      final updatedItems = List<CartItem>.from(state.items);
      updatedItems[index].quantity++;
      emit(CartState(items: updatedItems));
    } else {
      final updatedItems = List<CartItem>.from(state.items);
      updatedItems.add(CartItem(grocery: event.grocery));
      emit(CartState(items: updatedItems));
    }
  }

  void _onRemoveFromCart(RemoveFromCart event, Emitter<CartState> emit) {
    final updatedItems = state.items
        .where((item) => item.grocery.id != event.grocery.id)
        .toList();
    emit(CartState(items: updatedItems));
  }

  void _onIncreaseQuantity(IncreaseQuantity event, Emitter<CartState> emit) {
    final index =
        state.items.indexWhere((item) => item.grocery.id == event.grocery.id);
    if (index >= 0) {
      final updatedItems = List<CartItem>.from(state.items);
      updatedItems[index].quantity++;
      emit(CartState(items: updatedItems));
    }
  }

  void _onDecreaseQuantity(DecreaseQuantity event, Emitter<CartState> emit) {
    final index =
        state.items.indexWhere((item) => item.grocery.id == event.grocery.id);
    if (index >= 0) {
      final updatedItems = List<CartItem>.from(state.items);
      if (updatedItems[index].quantity > 1) {
        updatedItems[index].quantity--;
      } else {
        updatedItems.removeAt(index);
      }
      emit(CartState(items: updatedItems));
    }
  }

  int getQuantity(Grocery grocery) {
    final index =
        state.items.indexWhere((item) => item.grocery.id == grocery.id);
    if (index >= 0) {
      return state.items[index].quantity;
    }
    return 0;
  }
}
