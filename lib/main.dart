import 'package:dairy_farm/screens/home_screen.dart';
import 'package:dairy_farm/screens/milking_list_screen.dart';
import 'package:dairy_farm/screens/milking_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app_localizations.dart';

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
          HomeScreen.id: (context) => HomeScreen(),
          MilkingScreen.id: (context) => MilkingScreen(),
          MilkingListScreen.id: (context) => MilkingListScreen(),
        },
        supportedLocales: [
          Locale('en', 'US'),
          Locale('hi', 'IN'),
        ],
        localizationsDelegates: [
          // THIS CLASS WILL BE ADDED LATER
          // A class which loads the translations from JSON files
          AppLocalizations.delegate,
          // Built-in localization of basic text for Material widgets
          GlobalMaterialLocalizations.delegate,
          // Built-in localization for text direction LTR/RTL
          GlobalWidgetsLocalizations.delegate,
        ],
        localeResolutionCallback: (locale, supportedLocales) {
          // Check if the current device locale is supported
          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale.languageCode &&
                supportedLocale.countryCode == locale.countryCode) {
              return supportedLocale;
            }
          }
          // If the locale of the device is not supported, use the first one
          // from the list (English, in this case).
          return supportedLocales.first;
        },
        theme: ThemeData.light().copyWith(primaryColor: Colors.green, secondaryHeaderColor: Colors.purpleAccent),
      ),
    );
  }
}
