
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
       backgroundColor:    Color(0xFF7C8363),
       
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 10),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                     GestureDetector(
                      onTap: () => getimage(ImageSource.camera),
                      child: CircleAvatar(backgroundColor:  Color.fromARGB(255, 53, 58, 19),child:
                      picked== null?Icon(Icons.add_a_photo):ClipOval(child: Image.file(picked!,fit: BoxFit.cover,   height: 120,
                                width: 120,),),
                      radius: 60,),
                    ),SizedBox(height: 10),
                    TextFormField(
                      
                maxLength:10 ,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.horizontal(left:Radius.circular(120),right: Radius.circular(120),)
                  ),
                  
                  
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.horizontal(left:Radius.circular(120),right: Radius.circular(120),)
                  ),labelText: 'WorkersName',labelStyle: TextStyle(color: Colors.white),

                  prefixIcon: Icon(Icons.person_2_outlined,color: Colors.white,)
                ),
               ),
               TextFormField(
                keyboardType: TextInputType.number,
                maxLength:10 ,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.horizontal(left:Radius.circular(120),right: Radius.circular(120),)
                  ), 
                  enabledBorder:OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.horizontal(left:Radius.circular(120),right: Radius.circular(120),)
                  ),labelText: 'mobileNumber',labelStyle: TextStyle(color: Colors.white) ,
                  
                prefixText: '+91 ',prefixStyle: TextStyle(color: Colors.white)),
               ),
               TextFormField(
                keyboardType: TextInputType.number,
                maxLength:10 ,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.horizontal(left:Radius.circular(120),right: Radius.circular(120),)
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.horizontal(left:Radius.circular(120),right: Radius.circular(120),)
                  ),labelText: 'Age',labelStyle: TextStyle(color: Colors.white),
                   prefixIcon: Icon(Icons.calendar_month,color: Colors.white,)
                ),
                
               ),
               DropdownButtonFormField(decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.horizontal(left: Radius.circular(120),right: Radius.circular(120)),),labelText: 'job Categories',labelStyle: TextStyle(color: Colors.white)),
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
            
                ElevatedButton(
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.white)),
                  onPressed: (){
                    
                      
                       Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                      
                     
                     }, child: Text("SUBMIT",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),))
                  ],
                ),
              )
               
             
            ],
          ),
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