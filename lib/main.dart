import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_examples/src/ecommerce_app/view/ecommerce_app.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent status bar
  ));
  runApp(
    EcommerceApp(),
  );
}
