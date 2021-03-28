import 'package:flutter/material.dart';

class ShopBottomNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        height:65,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
             height:55,
              width: MediaQuery
                  .of(context)
                  .size
                  .width / 2 - 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.home, color: Colors.deepPurple,),
                  Icon(Icons.person_outline, color: Colors.deepPurple,),
                ],

              ),
            ),
            Container(
              height:55,
              width: MediaQuery
                  .of(context)
                  .size
                  .width / 2 - 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.search, color: Colors.deepPurple,),
                  Icon(Icons.shopping_bag, color: Colors.deepPurple,),
                ],

              ),
            ),
          ], //children
        ),
      ),
      color: Colors.green,
      shape: CircularNotchedRectangle(),
      notchMargin: 5.0,
      clipBehavior: Clip.antiAlias,
    );
  }
}