
import 'package:contracterApp/homePage.dart';
import 'package:flutter/material.dart';

class DetailsAdd extends StatefulWidget {
  const DetailsAdd({super.key});

  @override
  State<DetailsAdd> createState() => _DetailsAddState();
}

class _DetailsAddState extends State<DetailsAdd> {

  String selectedjob='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.blueGrey,
       
      body: Container(
        margin: EdgeInsets.only(top: 120),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
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
  }