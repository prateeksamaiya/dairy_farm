import 'package:flutter/material.dart';

import '../app_localizations.dart';
import 'package:recase/recase.dart';


class ApplicationUtil {
  static DateTime midnight([DateTime datetime]) {
    DateTime now = datetime ?? DateTime.now();
    return DateTime(now.year, now.month, now.day);
  }

  static String translate(String key) {
    print(key.snakeCase);
    var value = AppLocalizations.instance.translate(key.snakeCase);
    return value ?? key.titleCase;
  }

  static void showSnackbar(context, Widget widget) {
    final snackBar = SnackBar(
      content: widget,
      duration: Duration(milliseconds: 2000),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    return;
  }
}
