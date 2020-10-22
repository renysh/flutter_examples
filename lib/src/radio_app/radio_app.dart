import 'package:flutter/material.dart';
import 'package:flutter_examples/src/radio_app/bloc/station_provider.dart';
import 'package:flutter_examples/src/radio_app/view/pages/home_page.dart';
import 'package:provider/provider.dart';

class RadioApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => StationProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Radio App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.grey,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: Theme.of(context).textTheme.apply(
                fontFamily: 'SF Pro Display',
                bodyColor: Colors.white,
              ),
        ),
        home: HomePage(),
      ),
    );
  }
}
