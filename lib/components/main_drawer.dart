import 'package:dairy_farm/models/milking_entry.dart';
import 'package:dairy_farm/screens/milking_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:dairy_farm/screens/milking_screen.dart';
import 'package:dairy_farm/screens/home_screen.dart';
import 'package:dairy_farm/provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../app_localizations.dart';
import '../translation_constants.dart';


class MainDrawer extends HookWidget {

  @override
  Widget build(BuildContext context) {
    final state = useProvider(navigation_select).state;
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              child: Image.asset(
                'images/cattle_icon.png',
              )),
          ListTile(
            selected: state == 0,
            leading: Icon(Icons.home,size: 30,),
            title: Text(AppLocalizations.of(context).translate(home)),
            onTap: (){
              context.read(navigation_select).state = 0;
              Navigator.pushReplacementNamed(context, HomeScreen.id);
            },
          ),
          ListTile(
            selected: state == 1,
            leading: Image.asset(
              'images/milking.png',
              width: 30.0,
              height: 30.0,
              color: null,
            ),
            title: Text( AppLocalizations.of(context).translate(milking)),
            onTap: (){
              context.read(navigation_select).state = 1;
              context.read(milkEntryProvider).state = MilkingEntry();
              Navigator.pushReplacementNamed(context, MilkingScreen.id);
            },
          ),
          ListTile(
            selected: state == 2,
            leading: Image.asset(
              'images/milking.png',
              width: 30.0,
              height: 30.0,
              color: null,
            ),
            title: Text(AppLocalizations.of(context).translate(milkingDetails)),
            onTap: (){
              context.read(navigation_select).state = 2;
              Navigator.pushReplacementNamed(context, MilkingListScreen.id);
            },
          ),
        ],
      ),
    );
  }
}