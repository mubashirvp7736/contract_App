
import 'package:contracterApp/loginPage.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
  gotoScreen();

    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lime,
      body:Center(
        child: Image(image:AssetImage('assets/splashscreen.png.png'),height: 350,width:360,),
      ) ,
    );
  }

  Future<void> gotoScreen()async{
    await Future.delayed(Duration(seconds: 4));
  Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => UserLogin(),));
  }
}