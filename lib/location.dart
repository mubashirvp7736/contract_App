import 'package:flutter/material.dart';

class Locate extends StatelessWidget {
  const Locate({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
     body: Card(
      child: Column(
        children: [
          Text('Men'),
          Image(image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSHw7cFce2-ulLhCdmnSHN2lGifZnzVoZ-SwQ&usqp=CAU')
              ) ,
               Card(
                margin: EdgeInsets.all(40),
child: Column(
  children: [
    Image(image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSHw7cFce2-ulLhCdmnSHN2lGifZnzVoZ-SwQ&usqp=CAU')
 ) ],
),

               ) ,     
                     ],
      ),
     ),
     
    );
  }
}