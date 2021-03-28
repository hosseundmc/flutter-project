import 'dart:convert';
import 'package:flutter/material.dart';
import 'ShopBottomNavigator.dart';
import 'package:http/http.dart';
import 'dart:async';
import 'Product.dart';
void main() => runApp(store());

class store extends StatefulWidget {

  @override
  _storeState createState() => _storeState();
}

class _storeState extends State<store> {
  List <Product> _items =[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchItems();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "فروشگاه",
            style: TextStyle(color: Colors.deepPurple, fontFamily: "Vazir"),
          ),
          centerTitle: true,
          leading: Icon(Icons.arrow_back, color: Colors.black54),
          backgroundColor: Colors.green,
          elevation: 0,
          actions: [
            IconButton(
              icon: Icon(Icons.shop, color: Colors.deepPurple),
            )
          ], //actions
        ),
        bottomNavigationBar: ShopBottomNavigator(),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.deepPurple,
          child: Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: Padding(
          padding: EdgeInsets.all(14),
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 15,
            children: List.generate(_items.length, (int position) {
              return generateItem(_items[position]);
            }),
          ),
        ),
      ),
    );
  }
 void fetchItems() async{
    Response response = await get(Uri.parse("http://welearnacademy.ir/flutter/products_list.json"));
    print(utf8.decode(response.bodyBytes));
    setState(() {
    var productJson = json.decode(utf8.decode(response.bodyBytes));
      for(var i in productJson) {
        var productItems = Product(
            i['_productName'], i['_id'], i['_price'], i['_imageUrl'], i[' off'],
            i['_description']);
        _items.add(productItems);
      }
    });
 }

}
Card generateItem(Product product) {
  return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      elevation: 6,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 90,
              height: 90,
              child: Image.network("http://welearnacademy.ir/flutter/black.png",),
            ),
            Text(
              product.price,
              style:
              TextStyle(fontFamily: "Vazir", color: Colors.green, fontSize: 14),
            ),
            Text(
              product.productName,
              style:
              TextStyle(fontFamily: "Vazir", color: Colors.deepPurple, fontSize: 14),
            ),
          ],
        ),
      ));
}

