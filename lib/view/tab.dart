// import 'package:flutter/material.dart';

// class tab extends StatefulWidget {
//   @override
//   State<tab> createState() => _MyAppState();
// }

// class _MyAppState extends State<tab> {
//   int indenum=0;
//   List works=[
//     'CementWork',
//     'buildingWork',
//     'SocialWOrk',
//     'Painting'
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         backgroundColor: Color(0xFF7C8363) ,
//         body: GridView.builder(
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2, // Number of columns
//             crossAxisSpacing: 8.0, // Spacing between columns
//             mainAxisSpacing: 8.0, // Spacing between rows
//           ),
//           itemBuilder: (context, index) {
//             return Card(
//               color: Colors.black12,
//               shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
//               child: Padding(
//                 padding: const EdgeInsets.only(top: 70),
//                 child: Column(
//                  children: [
//                     Text(works[index],style: TextStyle(fontSize: 20),)
//                  ],
//                 ),
//               ),
//             );
//              },
//           itemCount: 4, 
//         ),
//       ),
//     );
//   }
// }

import 'package:contracterApp/view/workersDetails.dart';
import 'package:flutter/material.dart';
import 'package:contracterApp/db/model/model.dart'; // Import your model file

class TabPage extends StatefulWidget {
  @override
  State<TabPage> createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  List<String> jobCategories = ['CementWork', 'BuildingWork', 'SocialWork', 'Painting'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF7C8363),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ListWorkers(selectedJobCategory: jobCategories[index]),
                  ),
              );
            },
            child: Card(
              color: Colors.black12,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Padding(
                padding: const EdgeInsets.only(top: 70),
                child: Column(
                  children: [
                    Text(jobCategories[index], style: TextStyle(fontSize: 20)),
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: jobCategories.length,
      ),
    );
  }
}
