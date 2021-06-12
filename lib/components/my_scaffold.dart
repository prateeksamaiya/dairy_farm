import 'package:dairy_farm/util/applicaition_util.dart';
import 'package:flutter/material.dart';
import '../translation_constants.dart';
import 'main_drawer.dart';

class MyScaffold extends StatelessWidget {
  final Widget body;
  final Function onPressed;

  MyScaffold(this.body, [this.onPressed]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ApplicationUtil.translate(title)),
      ),
      body: body,
      drawer: MainDrawer(),
      floatingActionButton: onPressed==null?null:FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: onPressed,
      ),
    );
  }
}
