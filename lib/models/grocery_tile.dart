import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/bloc/bloc/cart_bloc.dart';
import 'package:my_app/models/grocery_item.dart';

class GroceryTile extends StatelessWidget {
  final Grocery grocery;
  const GroceryTile({super.key, required this.grocery});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        final cartBloc = context.read<CartBloc>();
        final isInCart =
            state.items.any((item) => item.grocery.id == grocery.id);
        final quantity = cartBloc.getQuantity(grocery);
        return Padding(
          padding: const EdgeInsets.all(15),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Color.fromARGB(255, 218, 216, 216),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //image

                Image.asset(
                  grocery.imagePath,
                  height: 64,
                ),

                //itemname
                Text(
                  grocery.name,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                //price

                Text(
                  'Rs. ' + grocery.price.toStringAsFixed(2),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                //add to cart button
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      iconSize: 30,
                      icon: Icon(
                        isInCart
                            ? Icons.remove_shopping_cart
                            : Icons.add_shopping_cart,
                      ),
                      onPressed: () {
                        if (isInCart) {
                          cartBloc.add(RemoveFromCart(grocery: grocery));
                        } else {
                          cartBloc.add(AddToCart(grocery: grocery));
                        }
                      },
                    ),
                    if (isInCart)
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              iconSize: 30,
                              icon: Icon(Icons.remove),
                              onPressed: () {
                                cartBloc
                                    .add(DecreaseQuantity(grocery: grocery));
                              },
                            ),
                            Text(
                              '$quantity',
                              style: TextStyle(fontSize: 20),
                            ),
                            IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () {
                                cartBloc
                                    .add(IncreaseQuantity(grocery: grocery));
                              },
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
