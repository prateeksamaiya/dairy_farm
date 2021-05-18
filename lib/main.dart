import 'package:dairy_farm/screens/milking_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:dairy_farm/screens/milking_screen.dart';
import 'package:dairy_farm/screens/home_screen.dart';
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
          MilkingScreen.id:(context)=> MilkingScreen(),
          MilkingListScreen.id:(context)=> MilkingListScreen(),
        },
        theme: ThemeData.light().copyWith(primaryColor: Colors.green,secondaryHeaderColor: Colors.purpleAccent),
      ),
    );
  }
}


