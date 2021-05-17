//import 'package:dairy_farm/models/milking_entry.dart';
//import 'package:flutter/material.dart';
//import 'package:hooks_riverpod/hooks_riverpod.dart';
//import 'package:flutter_hooks/flutter_hooks.dart';
//import 'package:dairy_farm/provider.dart';
//
//class MyHomePage extends HookWidget {
//  static const String id = "milking1";
//  var milkingEntry = MilkingEntry(0,0.0);
//  var snackbar;
//
//  void showSnackbar(context, String message) {
//    final snackBar = SnackBar(content: Text(message));
//    ScaffoldMessenger.of(context).showSnackBar(snackBar);
//    return;
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    print("building MYHomePage");
//    return Scaffold(
//        appBar: AppBar(
//          title: const Text('Riverpod counter example'),
//        ),
//        body: Container(),
//        floatingActionButton: FloatingActionButton(onPressed: () => {
//            context.read(futureProvider(milkingEntry)).when(
//              data: (message) => showSnackbar(context,message),
//              loading: () => showSnackbar(context,"loading"),
//              error: (error, stack) => showSnackbar(context,error.toString()))
//        }));
//  }
//}
