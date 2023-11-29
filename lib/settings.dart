
import 'package:flutter/material.dart';

class Account extends StatelessWidget {
  Account({Key? key}) : super(key: key);
  final listText = [
    'Home',
    'Account',
    'settings',
    'About',
  ];
final screens = [
];
  List holcon=[
  Icon(Icons.home),
  Icon(Icons.person),
  Icon(Icons.settings),
  Icon(Icons.camera)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.blueGrey,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 40,
                    child: Icon(
                      Icons.person_outline_rounded,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 50, 
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.black),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        onPressed: () {},
                        child: Text("Sign in /logout"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => ListTile(
                leading: holcon[index],
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return screens[index];
                    },
                  ));
                },
                trailing: Icon(Icons.arrow_forward_ios, size: 15),
                title: Text(
                  listText[index],
                  style: TextStyle(fontSize: 14),
                ),
              ),
              separatorBuilder: (context, index) => Divider(),
              itemCount: 4,
            ),
            Center(
              child: Text('Version 9.15.0'),
            ),
          ],
        ),
      ),
    );
  }
}
 