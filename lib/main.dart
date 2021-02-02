import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_examples/src/menu_side_animation/menu_side_animation.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent status bar
  ));
  runApp(
    MenuSideAnimation(),
  );
}
