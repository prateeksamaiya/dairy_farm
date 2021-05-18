import 'package:dairy_farm/screens/milking_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:dairy_farm/screens/milking_screen.dart';
import 'package:dairy_farm/screens/home_screen.dart';

class MainDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              child: Image.asset(
                'images/cattle_icon.png',
              )),
          ListTile(
            leading: Icon(Icons.home,size: 30,),
            title: Text("Home"),
            onTap: (){
              Navigator.pushReplacementNamed(context, HomeScreen.id);
            },
          ),
          ListTile(
            leading: Image.asset(
              'images/milking.png',
              width: 30.0,
              height: 30.0,
              color: null,
            ),
            title: Text("Milking"),
            onTap: (){
              Navigator.pushReplacementNamed(context, MilkingScreen.id);
            },
          ),
          ListTile(
            leading: Image.asset(
              'images/milking.png',
              width: 30.0,
              height: 30.0,
              color: null,
            ),
            title: Text("MilkingListScreen"),
            onTap: (){
              Navigator.pushReplacementNamed(context, MilkingListScreen.id);
            },
          ),
        ],
      ),
    );
  }
}