
import 'package:contracterApp/db/function/functions.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
  gotoScreen(context);
 checkuserlogin(context);
    super.initState();
  }
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF7C8363),
      body:Center(
        child: Image(image:AssetImage('assets/splashscreen.png.png'),height: 350,width:360,),
      ) ,
    );
  }

}