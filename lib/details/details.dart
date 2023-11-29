import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  const Details({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
        backgroundColor: Colors.blueGrey,
      ),
        body:Padding(
          padding: EdgeInsets.only(top: 190,left: 0,),
          child: Container(
            height: 160,
            width: 360,
            color: Colors.grey,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                   maxRadius: 50,
                   backgroundColor: Colors.black,
                   child: Icon(
                      Icons.person_outline_rounded,
                      color: Colors.white,
                      size: 70,)
                ),
                Column(
                  children: [
                    Text('Name 1',style: TextStyle(fontSize: 20),),SizedBox(height: 10,),   
                    Text('Age',style: TextStyle(fontSize: 20),),SizedBox(height: 20,),
                    Text('7736175661',style: TextStyle(fontSize: 20),), SizedBox(height: 20,),                
                    Text('Job Categorie',style: TextStyle(fontSize: 20),),
                  ],
                ),
              ],
            ),
          
          ),
        ),
    );
  }
}