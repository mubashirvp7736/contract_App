
import 'package:contracterApp/addWorkers.dart';
import 'package:contracterApp/homePage.dart';
import 'package:contracterApp/main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class UserLogin extends StatefulWidget {
  const UserLogin({super.key});

  @override
  State<UserLogin> createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
   final _username=TextEditingController();
   final _password=TextEditingController();

 final _form=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor:Color.fromARGB(255, 224, 235, 188),
       appBar: AppBar(
        title: Text('User Login'),
        backgroundColor:Color.fromARGB(255, 78, 80, 72)),
       body:SingleChildScrollView(
        scrollDirection: Axis.vertical,
         child: Column(
           children:[ 
            Container(
              height: MediaQuery.of(context).size.height*0.4,
            //  color: Color.fromARGB(255, 140, 148, 112),
             child: Image(image: AssetImage('assets/user-removebg-preview.png')),
            ),
            
            Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                height: MediaQuery.of(context).size.height*0.43,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 90, 97, 68),
                  borderRadius: BorderRadius.circular(50)
                ),
                //  Color:Color.fromARGB(255, 224, 235, 188),
                padding: EdgeInsets.all(30),
                child: Form(
                  key: _form,
                  child: Column(
                    children: [
                       TextFormField(
                        controller:_username ,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          enabledBorder: 
                          OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white,
                            
                          
                          ),
                     borderRadius: BorderRadius.circular(60),), hintText: 'UserName',),)
                     ,SizedBox(height: 16,),
                      TextFormField(
                     controller: _password,
                      style: TextStyle(color: Colors.white),
                     decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(30)
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(30)
                      ),
                     hintText: 'Password')), SizedBox(height: 17,),
                 ElevatedButton(
                     style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.white)),
                  onPressed: (){
                    if(_form.currentState!.validate()){
                  checkLogin(context);
                     }else{
                     print('data is empty');
                        }
                   checkLogin(context);
                     },
                   
                  child:Text('SUBMIT',style: TextStyle(color: Colors.black),)
                      )
                    ],
                  ),
                ),
              ),
            ),
              ]  ),
       )
        );
  }
  void checkLogin(BuildContext context)async{
  final _usernames=_username.text;
  final _passwords=_password.text;

  if(_usernames=='mubu'&& _passwords=='7736'){
   print('suuccessful');
   final _sharedpref= await SharedPreferences.getInstance();
   await _sharedpref.setBool(save_key_name, true);
   Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>HomeScreen()));
  }else{
    final _errormessage='username password doesnot match';
  }

  }
}