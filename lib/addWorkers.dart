
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
      backgroundColor: Colors.brown[200],
       body:       
       Container(
         child: Column(
           children: [
            TextFormField(
              decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(120)),hintText: 'serach.....'),
            ),
          
             Expanded(
          
     child: ListView.builder(itemBuilder: (context, index){
               return GestureDetector(
                onTap: () {
               //   Navigator.push(context, MaterialPageRoute(builder: (context)=>details()));
                },
                 child: Card(
                  color: Colors.grey[700],
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                  ),
                    child: 
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text("Name 1",style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),),
                              SizedBox(height: 10,),
                              Text("7736175661",style: TextStyle(fontWeight: FontWeight.w500),),
                              Text("12",style: TextStyle(fontWeight: FontWeight.w100),),
                              Text('job categorie')
                              
                            ],
                          ),
                          Row(
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

