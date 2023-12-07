
import 'package:contracterApp/details/details.dart';
import 'package:contracterApp/edit/edit.dart';
import 'package:flutter/material.dart';

class AddWorkers extends StatefulWidget {
  const AddWorkers({super.key});

  @override
  State<AddWorkers> createState() => _AddWorkersState();
}

class _AddWorkersState extends State<AddWorkers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF7C8363),
       body:       
       Container(
         child: Column(
           children: [
            TextFormField(
              decoration: InputDecoration(
                 focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(120)
                  ),
                 enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(120)
                  ),labelText: 'serach.....'),),
             Expanded(child: ListView.builder(itemBuilder: (context, index){
               return GestureDetector(
                onTap: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>Details()));
                },
                 child: Card(
                  color: Colors.white70,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                  ),
                    child: 
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          CircleAvatar( backgroundColor: Color.fromARGB(255, 91, 92, 88),
                    radius: 30,
                    child: Icon(
                      Icons.person_outline_rounded,
                      color: Colors.white,
                      size: 40,
                    ),),SizedBox(width: 70,),
                             Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text("Name 1",style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20,),),
                                    SizedBox(height: 10,),
                                    Text("7736175661",style: TextStyle(fontWeight: FontWeight.w400),),
                                    Text("12",style: TextStyle(fontWeight: FontWeight.w100),),
                                    Text('job categorie')
                                    
                                  ],
                                ),SizedBox(width: 60,),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(onPressed: (){
                                     Navigator.push(context, MaterialPageRoute(builder: (context)=>edit()));
                                    }, 
                                    icon: Icon(Icons.edit,size: 20,)),
                                    IconButton(onPressed: (){}, icon: Icon(Icons.delete,color: Colors.deepOrangeAccent,))
                                  ],
                                )
                              ],
                            ),
                          
                        ],
                      ),
                    ),
                  ),
               );
              },
              itemCount: 50,
              ),
            ),
          ],
        ),
      ),  );
   }
 }

