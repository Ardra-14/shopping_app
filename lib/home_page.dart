import 'package:flutter/material.dart';
import 'package:my_app/cart_page.dart';
import 'package:my_app/intro_page.dart';
import 'package:my_app/models/grocery_item.dart';
import 'package:my_app/models/grocery_tile.dart';

class HomePage extends StatelessWidget {
  final List<Grocery> groceryItems = [
    Grocery(id: 1, name: 'Avocado', price: 214, imagePath: 'assets/1.jpg'),
    Grocery(id: 2, name: 'Banana', price: 35, imagePath: 'assets/2.jpg'),
    Grocery(id: 3, name: 'Chicken', price: 249, imagePath: 'assets/3.jpg'),
    Grocery(id: 4, name: 'Cola', price: 72, imagePath: 'assets/4.jpg')
  ];
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder:(context) => IntroPage(),));
          }, 
          icon: Icon(Icons.arrow_back)
          ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed:(){
          Navigator.push(context, MaterialPageRoute(builder:(context) => CartPage(),));
        },
        child:Icon(Icons.shopping_cart,
        color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment : CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text('Good Morning!',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(height:4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text('Lets order fresh items for you',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height:4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Divider(),
            ),
            SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text('Fresh Items',
              style: TextStyle(
                fontSize:20,
                color: Colors.black,
              ),
              ),
            ),

            Expanded(
              
              child: GridView.builder(
              padding: EdgeInsets.all(12),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                      childAspectRatio: 1 / 1.3,
                      ),
                      itemCount: groceryItems.length,
              itemBuilder: (context, index) {
                return GroceryTile(grocery: groceryItems[index]);
              },
              )
              ),
        ],
        ),
        )
    );
  }
}
