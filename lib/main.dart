import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_examples/src/navigation_transitions/navigation_transitions.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent status bar
  ));
  runApp(
    NavigationTransitions(),
  );
}
