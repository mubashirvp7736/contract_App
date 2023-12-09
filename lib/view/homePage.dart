
import 'package:contracterApp/db/function/functions.dart';
import 'package:contracterApp/view/addWorker.dart';
import 'package:contracterApp/view/workersDetails.dart';
import 'package:contracterApp/view/settings.dart';
import 'package:contracterApp/view/tab.dart';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:contracterApp/view/drawer.dart';
import 'dart:io';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  int indexnum = 0;
  List Widgets = [
     ListWorkers(),
      addstuds(),
       TabPage(),
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
          Icon(Icons.table_rows_sharp),  
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
 
}
