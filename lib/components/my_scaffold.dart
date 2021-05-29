import 'package:flutter/material.dart';
import 'main_drawer.dart';

class MyScaffold extends StatelessWidget {
  final Widget body;
  final Function onPressed;

  MyScaffold(this.body, [this.onPressed]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DairyFarm"),
      ),
      body: body,
      drawer: MainDrawer(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: onPressed,
      ),
    );
  }
}
