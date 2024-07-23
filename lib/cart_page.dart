import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/bloc/bloc/cart_bloc.dart';
import 'package:my_app/models/cart_item.dart';
import 'package:my_app/models/grocery_item.dart';

class CartPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          return Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: state.items.length,
              itemBuilder: (context, index) {
                final CartItem cartItem = state.items[index];
                return ListTile(
                  leading: Image.asset(
                    cartItem.grocery.imagePath,
                    height: 50,
                  ),
                  title: Text(cartItem.grocery.name),
                  subtitle: Text('Quantity: ${state.items[index].quantity}'),
                  trailing: IconButton(
                    icon: Icon(Icons.remove_shopping_cart),
                    onPressed: () {
                      BlocProvider.of<CartBloc>(context).add(RemoveFromCart(grocery: cartItem.grocery));
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(36),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.all(24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Total Price ",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        "Rs." + calculateTotal(state.items),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      );
        },
      )
    );
  }


    String calculateTotal(List<CartItem> items) {
    double totalprice = 0;
    items.forEach((item) {
      totalprice += item.grocery.price * item.quantity;
    });
    return totalprice.toStringAsFixed(2);
  }
}