import 'package:flutter/material.dart';
import 'package:flutter_examples/src/ecommerce_app/view/pages/home_ecommerce_page.dart';

class EcommerceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ecommerce App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: Theme.of(context).textTheme.apply(
              fontFamily: 'Poppins',
              bodyColor: Colors.white,
            ),
      ),
      home: HomeEcommercePage(),
    );
  }
}
