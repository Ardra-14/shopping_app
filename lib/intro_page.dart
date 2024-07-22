import 'package:flutter/material.dart';
import 'package:my_app/home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : Column(
        children : [
          Padding(
            padding: const EdgeInsets.only(
                top: 160, bottom:20, right: 80, left: 80),
            child: Image.asset('assets/intro.jpg'),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text('We deliver groceries at your doorstep',
            textAlign : TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize : 40,
            ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text('Fresh items everyday',
            style : TextStyle(
              fontSize : 20,
            ),
            ),
          ),
          SizedBox(height: 20),
          OutlinedButton(
            style: ButtonStyle(padding : WidgetStateProperty.all(EdgeInsets.all(20)),),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder:(context)=>HomePage()));
            },
            child : Text('Get Started',
            style : TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            ),
          )
        ],
      ),
    );
  }
}