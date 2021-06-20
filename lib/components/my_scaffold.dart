import 'package:dairy_farm/util/applicaition_util.dart';
import 'package:flutter/material.dart';
import '../translation_constants.dart';
import 'main_drawer.dart';

class MyScaffold extends StatelessWidget {
  final Widget body;
  final Function onPressed;
  final List<Widget> actions;

  MyScaffold(this.body, [this.onPressed,this.actions]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ApplicationUtil.translate(title)),
        actions: actions,
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
