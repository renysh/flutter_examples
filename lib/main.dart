import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_examples/src/animations/animations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent status bar
  ));
  runApp(
    Animations(),
  );
}
