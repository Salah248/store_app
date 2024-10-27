import 'package:flutter/material.dart';
import 'package:store_app/pages/add_product.dart';
import 'package:store_app/pages/home_page.dart';
import 'package:store_app/pages/update_Product_page.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        AddProductPage.id: (context) => const AddProductPage(),
        HomePage.id: (context) => HomePage(),
        UpdateProductPage.id: (context) => const UpdateProductPage(),
      },
      initialRoute: HomePage.id,
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
