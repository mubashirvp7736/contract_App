
import 'package:contracterApp/addWorkers.dart';
import 'package:contracterApp/settings.dart';
import 'package:contracterApp/workDetails.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:contracterApp/drawer/drawer.dart';
import 'dart:io';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int indexnum = 0;
  List Widgets = [
    AddWorkers(),
    DetailsAdd(),
    Account(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Navbar(),
      appBar: AppBar(
        title: Text('HomePage',style: TextStyle(color:Color(0xFFF6EDE3) ),),
        actions: [
          IconButton(
            onPressed: () {
              showPopupMenu(context);
            },
            icon: Icon(Icons.more_vert_outlined),
          ),
        ],
        backgroundColor: Color.fromARGB(255, 69, 107, 59),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        buttonBackgroundColor: Color(0xFF8ec9bc),
        color:Color.fromARGB(255, 69, 107, 59),
        items: [
         Icon(Icons.home),
          Icon(Icons.add_circle,size: 40,),  
          Icon(Icons.settings,), 
        ],
        backgroundColor:Colors.white,
        // currentIndex: indexnum,
        onTap: (int index) {
          setState(() {
            indexnum = index;
          });
        },
      ),
      body: Widgets.elementAt(indexnum),
    );
  }
  void showPopupMenu(BuildContext context) {
    showMenu(
      context: context,
      position: RelativeRect.fromRect(
        Rect.fromPoints(
          Offset(100, 100), 
          Offset(200, 200),
        ),
        Offset.zero & MediaQuery.of(context).size
      ),
      items: [
        PopupMenuItem(
          child: ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
            },
          ),
        ),
        PopupMenuItem(
          child: ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () {
            },
          ),
        ),
      ],
    );
  }
}
