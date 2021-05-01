import 'package:flutter/material.dart';
import 'milking_screen.dart';
import 'home_screen.dart';
import 'package:dairy_farm/application/milking_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(DairyApp());
}


class DairyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        initialRoute: HomeScreen.id,
        routes: {
          HomeScreen.id:(context)=> HomeScreen(),
          MilkingScreen.id:(context)=> MilkingScreen()
        },
        theme: ThemeData.light().copyWith(primaryColor: Colors.green,secondaryHeaderColor: Colors.purpleAccent),
      ),
    );
  }
}


