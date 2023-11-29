
import 'package:contracterApp/homePage.dart';
import 'package:flutter/material.dart';

class UserLogin extends StatefulWidget {
  const UserLogin({super.key});

  @override
  State<UserLogin> createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
       appBar: AppBar(
        title: Text('User Login'),
        backgroundColor: Colors.indigo,
      
       ),
       body:Container(
      //   decoration: BoxDecoration(
      //     image: DecorationImage(image: AssetImage("assets/loginfront.jpg"),fit: BoxFit.cover)
      //   ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                   TextFormField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      enabledBorder: 
                      OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white
                      ),
                        borderRadius: BorderRadius.circular(50),), hintText: 'UserName',hintStyle: TextStyle(color: Colors.indigo)),
             ),SizedBox(height: 16,),
             TextFormField(
                  style: TextStyle(color: Colors.white),
                
              decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)), hintText: 'Password',hintStyle: TextStyle(color: Colors.indigo)),
             ), SizedBox(height: 17,),
             ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
             }, 
             
             child:Text('submit')
             )
                ],
              ),
            )
          ],
        ),
       )
       

        );
         
         
         
         
         
    
  }
}