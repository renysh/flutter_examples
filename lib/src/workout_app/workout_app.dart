import 'package:flutter/material.dart';
import 'package:flutter_examples/src/workout_app/bloc/workout_provider.dart';
import 'package:flutter_examples/src/workout_app/view/pages/welcome_page.dart';
import 'package:provider/provider.dart';

class WorkOutApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => WorkoutProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'WorkOut App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.grey,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: WelcomePage(),
      ),
    );
  }
}
