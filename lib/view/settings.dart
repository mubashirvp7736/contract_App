import 'dart:io';

import 'package:contracterApp/db/second_model/model2.dart';
import 'package:contracterApp/view/emptyScreeen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Account extends StatefulWidget {
  Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  List<String> listText = ['Account', 'About'];

  final screens = [AccountScreen(), AboutScreen()];

  List<Icon> holcon = [
    Icon(Icons.person, color: const Color.fromARGB(255, 114, 103, 103)),
    Icon(Icons.camera, color: Colors.white)
  ];

  File? picked;
  final ImagePicker imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 186, 187, 182),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () => getimage(ImageSource.gallery),
                    child: buildAvatar(),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                ],
              ),
            ),
            SizedBox(height: 50,),
            Padding(
              padding: const EdgeInsets.all(17),
              child: ListView.separated(
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
                  trailing: Icon(Icons.arrow_forward_ios, size: 15, color: Colors.white,),
                  title: Text(
                    listText[index],
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                ),
                separatorBuilder: (context, index) => Divider(),
                itemCount: 2,
              ),
            ),
            SizedBox(height: 150,),
            Center(
              child: Text('Version 9.15.0', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildAvatar() {
     return  GestureDetector(
                    onTap: () => getimage(ImageSource.camera),
                    child: CircleAvatar(backgroundColor: Colors.black,child:
                    picked== null?Icon(Icons.add_a_photo):ClipOval(child: Image.file(picked!,fit: BoxFit.cover,   height: 120,
                              width: 120,),),
                    radius: 60,),
                  );
                 
     //CircleAvatar(
    //   backgroundImage: picked == null ? null : FileImage(picked!),
    //   backgroundColor: Colors.black,
    //   radius: 60,
    //   child: picked == null
    //       ? Icon(Icons.add_a_photo, color: Colors.white)
    //       : Container(),
    // );
  }

  getimage(ImageSource source) async {
    var img = await imagePicker.pickImage(source: source);
    setState(() {
      picked = File(img!.path);
    });
  }
}

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Implement your Account screen UI here
    return Container();
  }
}

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Implement your About screen UI here
    return Container();
  }
}
