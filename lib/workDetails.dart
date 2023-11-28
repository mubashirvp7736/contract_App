
import 'dart:io';

import 'package:contracterApp/homePage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class DetailsAdd extends StatefulWidget {
  const DetailsAdd({super.key});

  @override
  State<DetailsAdd> createState() => _DetailsAddState();
}

class _DetailsAddState extends State<DetailsAdd> {
  final imagepicker=ImagePicker();
  String selectedjob='';
  File? picked;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.blueGrey,
       
      body: Container(
        margin: EdgeInsets.only(top: 10),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                   GestureDetector(
                    onTap: () => getimage(ImageSource.camera),
                    child: CircleAvatar(backgroundColor: Colors.black,child:
                    picked== null?Icon(Icons.add_a_photo):ClipOval(child: Image.file(picked!,fit: BoxFit.cover,   height: 120,
                              width: 120,),),
                    radius: 60,),
                  ),SizedBox(height: 10),
                  TextFormField(
              maxLength:10 ,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.horizontal(left:Radius.circular(120),right: Radius.circular(120),)
                ),hintText: 'WorkersName'
              ),
             ),
             TextFormField(
              maxLength:10 ,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.horizontal(left:Radius.circular(120),right: Radius.circular(120),)
                ),hintText: 'mobileNumber'
              ),
             ),
             TextFormField(
              
              maxLength:10 ,
              decoration: InputDecoration(
              
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.horizontal(left:Radius.circular(120),right: Radius.circular(120),)
                ),hintText: 'Age'
              ),
              
             ),
             DropdownButtonFormField(decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.horizontal(left: Radius.circular(120),right: Radius.circular(120)),),hintText: 'job Categories'),
              items: <String>['building work', 'cement work', 'all rounder', 'material work']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
             onChanged: (value) => 
              setState(() {
                selectedjob;
              })
             ,),SizedBox(height: 18,),
          
              ElevatedButton(onPressed: (){
                  
                    
                     Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                    
                   
                   }, child: Text("SubMit",),)
                ],
              ),
            )
             
           
          ],
        ),
      ),

      
    );
  }
     getimage(ImageSource source) async {
    var img = await imagepicker.pickImage(source: source);
    setState(() {
      picked = File(img!.path);
      
    });
  
}

  }