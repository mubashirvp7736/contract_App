
import 'package:contracterApp/addWorkers.dart';
import 'package:contracterApp/settings.dart';
import 'package:contracterApp/workDetails.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int indexnum=0;
 List Widgets=[
   AddWorkers(),
   DetailsAdd(),
   SignOut()

 ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('HomePage'),
        backgroundColor: Colors.brown,
      ),
      bottomNavigationBar: 
       
      BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.add_circle),label: 'Add'),
        BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'Settings')
      
      

          
      ],backgroundColor: Colors.blueGrey,
      currentIndex:indexnum ,
      onTap: (int index) {
        setState(() {
          indexnum=index;
        });
      },

      ),
   
     body: Widgets.elementAt(indexnum),

    );
  }
}