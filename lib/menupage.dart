import 'package:flutter/material.dart';
import 'dart:async';
import 'package:uts_project/dbhelper.dart';
import 'home.dart';

class Menupage extends StatefulWidget {
  @override
  _MenupageState createState() => _MenupageState();
}

class _MenupageState extends State<Menupage> {
  DbHelper dbHelper = DbHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu Morfeen'),
      ),
      endDrawer: _buildDrawer(),
    );
  }

  Widget _buildDrawer(){
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _drawerItem(
            icon: Icons.folder,
            text: 'My File',
            onTap: () async{
              var menu = await navigateToHome(context, null);
            },
          ),
          _drawerItem(
            icon: Icons.group,
            text: 'Follow Grup Morfeen',
            onTap: () {},
          ),
          _drawerItem(
            icon: Icons.delete,
            text: 'Delete Acoount',
            onTap: () {},
          )          
        ],
      ),
    );
  }
  Widget _drawerItem(
    {IconData icon, String text, GestureTapCallback onTap}) {
  return ListTile(
    title: Row(
      children: <Widget>[
        Icon(icon),
        Padding(
          padding: EdgeInsets.only(left: 25.0),
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
    onTap: onTap,
  ); 
}

  Future<Menupage> navigateToHome(BuildContext context, Menupage menupage) async {
    var result = await Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return Home();
    }));
    return result;
  }
}

