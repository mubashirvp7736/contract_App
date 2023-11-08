// ignore_for_file: prefer_const_constructors

import 'package:agile/delete.dart';
import 'package:agile/details.dart';
import 'package:agile/location.dart';
import 'package:agile/searchscreen.dart';
import 'package:flutter/material.dart';
import 'package:agile/homescreen.dart';
import 'package:agile/details.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  int indexnum=0;
  List tablewidgets=[
    Homesc(),
    Details(),
    Search(),
    Locate(),
    Delete()
   ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Container(
          color: Color.fromARGB(13, 0, 0, 0),
          child: Row(
            children: [
              Image(
                image: AssetImage('assets/unnamed.png'),
                width: 35,
                height: 35,
              ),
              SizedBox(
                  width:
                      8), // Add some space between the icon and the TextField
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search by product, brand',
                    border: InputBorder.none,
                  ),
                ),
              ),
              Icon(
                Icons.camera_alt_outlined,
                color: Colors.black,
              ),
              SizedBox(
                width: 8,
              )
            ],
          ),
        ),
              
        
          
          actions: [
            
            Icon(Icons.badge,color: Colors.amber,),
            SizedBox(width:7),
            Icon(Icons.heart_broken_rounded,color: Colors.black,),
            SizedBox(width: 8,),
            Icon(Icons.add_alert_sharp,color: Colors.red,)
          ],
        ),
         
        bottomNavigationBar: BottomNavigationBar(
          
          items: 
           
          [
            
            BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home',backgroundColor: Colors.greenAccent),
                      BottomNavigationBarItem(icon: Icon(Icons.search),label: 'search',backgroundColor: Colors.red),
            BottomNavigationBarItem(icon: Icon(Icons.delete_forever),label: 'delete',backgroundColor: Colors.yellow),
            BottomNavigationBarItem(icon: Icon(Icons.room_rounded),label: 'location',backgroundColor: Colors.black),
            BottomNavigationBarItem(icon: Icon(Icons.location_city),label: 'locu',backgroundColor: Colors.yellow)
    
         
         
          ],
          currentIndex: indexnum,
          onTap:(int index){
            setState(() {
              indexnum=index;
            });
            
          }
            
        
        
        ),
       body:tablewidgets.elementAt(indexnum)
       
   
      
      ),
      
    );
  }
}