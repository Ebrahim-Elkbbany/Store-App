import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:store/screens/home_page.dart';
import 'package:store/screens/update_product.dart';

void main() {
  runApp(const Store());
}

class Store extends StatelessWidget {
  const Store({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        HomePage.id: (context) => HomePage(),
        UpdateProduct.id:(context)=> UpdateProduct(),
      },
      initialRoute: HomePage.id,
    );
  }
}
