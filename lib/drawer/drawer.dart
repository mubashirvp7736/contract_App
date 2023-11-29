import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.blueGrey[200],
      child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 45),
                child: CircleAvatar(
                  backgroundColor: Colors.black,
                  maxRadius: 50,
                  child: Icon(
                        Icons.person_outline_rounded,
                        color: Colors.white,
                        size: 60,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 70,left: 10),
                child: Container(
                  child: Row(
                    children: [
                      Icon(Icons.settings,size: 30,),SizedBox(width: 80,),
                      Text('Settings',style: TextStyle(fontSize: 20),)
                    ],
                  ),
                ),
              ),SizedBox(height: 50,),
             Container(
              margin: EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Icon(Icons.home,size: 30,),SizedBox(width: 90,), Text('Home',style: TextStyle(fontSize: 20),)
                ],
              ),
             ),SizedBox(height: 50,),
               Container(
              margin: EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Icon(Icons.logout,size: 30,),SizedBox(width: 90,), Text('Logout',style: TextStyle(fontSize: 20),)
                ],
              ),
             ),
            ],
          ),
        );
  }
}