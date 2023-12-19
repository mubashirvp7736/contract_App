import 'dart:io';

import 'package:contracterApp/db/function/functions.dart';
import 'package:contracterApp/view/edit.dart';
import 'package:flutter/material.dart';
import 'package:contracterApp/db/second_function/function2.dart';

class ScreenDrawer extends StatefulWidget {
  const ScreenDrawer({Key? key}) : super(key: key);

  @override
  State<ScreenDrawer> createState() => _ScreenDrawerState();
}

class _ScreenDrawerState extends State<ScreenDrawer> {
  @override
  Widget build(BuildContext context) {
    getallprofile();

    return Drawer(
      child: Scaffold(
        backgroundColor: Colors.brown[100],
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blueGrey,
          title: Text('My Profile'),
        ),
        body: ValueListenableBuilder(
          valueListenable: profilNotifier,
          builder: (context, value, child) {
            return
        
           ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              final data = value[index];
              return Padding(
                padding: const EdgeInsets.only(top: 120),
                child: Column(

                  children: [
                    CircleAvatar(
                       backgroundImage: FileImage(File(data.image!)),maxRadius:60 ,
                    ),
                    Text('Name: ${data.name}',style: TextStyle(fontSize: 30),),SizedBox(height: 10,),
                    Text('No:  ${data.age}',style: TextStyle(fontSize: 30),),SizedBox(height: 10,),
                     Text('Age:${data.number}',style: TextStyle(fontSize: 30),),SizedBox(height: 10,),
                  ],
                ),
              );
            },
          );
   } ),
      ),
    );
  }
}
