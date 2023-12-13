import 'package:flutter/material.dart';

class Details extends StatelessWidget {
 final String name;
 final String number;
 final String age;
 final String jobcategories;
 final String image;

  const Details({super.key, required this.name, required this.number, required this.age, required this.jobcategories,required this.image});

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
            height: MediaQuery.of(context).size.height*0.3,
            width: MediaQuery.of(context).size.width*1.12,
            color: Colors.blueGrey,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                   maxRadius: 40,
                   backgroundImage: AssetImage(image),
                   child: Icon(
                      Icons.person_outline_rounded,
                      color: Colors.red,
                      size: 30,)
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(name,style: TextStyle(fontSize: 20),),SizedBox(height: 10,),   
                      Text(number,style: TextStyle(fontSize: 20),),SizedBox(height: 20,),
                      Text(age,style: TextStyle(fontSize: 20),), SizedBox(height: 20,),                
                      Text(jobcategories,style: TextStyle(fontSize: 20),),
                    ],
                  ),
                ),
              ],
            ),
          
          ),
        ),
    );
  }
}