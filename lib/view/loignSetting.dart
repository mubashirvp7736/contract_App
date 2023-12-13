import 'package:flutter/material.dart';

class ShowIma extends StatelessWidget {
  
final String image;
final String name;
ShowIma({required this.image,required this.name});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CircleAvatar(backgroundImage: AssetImage(image),),
    );
  }
}