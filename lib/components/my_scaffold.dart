import 'package:flutter/material.dart';
import 'main_drawer.dart';

class MyScaffold extends StatelessWidget {

  final Widget body;

  MyScaffold({this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("DairyFarm"),),
      body: body,
      drawer: MainDrawer(),
    );
  }
}