
import 'package:flutter/material.dart';

Widget home(){
   return Scaffold(
    appBar: AppBar(
      title: Text('Home'),
    ),
    body: Center(
      child: Text('Home details',style: TextStyle(fontSize: 40),),
    ),
   );
}
Widget account(){
   return Scaffold(
    appBar: AppBar(
      title: Text('Account'),
    ),    body: Center(
      child: Text('Account details',style: TextStyle(fontSize: 40),),
    ),
   );
}
Widget Settings(){
   return Scaffold(
    appBar: AppBar(
      title: Text('Settings'),
    ),    body: Center(
      child: Text('Setting details',style: TextStyle(fontSize: 40),),
    ),
  );

}
Widget Aboute(){
   return Scaffold(
    appBar: AppBar(
      title: Text('About'),
    ),    body: Center(
      child: Text('About details',style: TextStyle(fontSize: 40),),
    ),
   );

}