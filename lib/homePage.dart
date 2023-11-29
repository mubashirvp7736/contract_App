
import 'package:contracterApp/addWorkers.dart';
import 'package:contracterApp/settings.dart';
import 'package:contracterApp/workDetails.dart';
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
    SignOut(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Navbar(),
      appBar: AppBar(
        title: Text('HomePage'),
        actions: [
          IconButton(
            onPressed: () {
              showPopupMenu(context);
            },
            icon: Icon(Icons.more_vert_outlined),
          ),
        ],
        backgroundColor: Colors.brown,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.add_circle), label: 'Add'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings')
        ],
        backgroundColor: Colors.blueGrey,
        currentIndex: indexnum,
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
          Offset(100, 100), // coordinates where you want to show the menu
          Offset(200, 200),
        ),
        Offset.zero & MediaQuery.of(context).size,
      ),
      items: [
        PopupMenuItem(
          child: ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => SettingsScreen()),
            //  );
            },
          ),
        ),
        PopupMenuItem(
          child: ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () {
              // Implement logout functionality
            },
          ),
        ),
      ],
    );
  }
}
