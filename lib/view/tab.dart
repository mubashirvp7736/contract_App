
import 'package:contracterApp/tabview/buildingWork.dart';
import 'package:contracterApp/tabview/cementWork.dart';
import 'package:contracterApp/tabview/painting.dart';
import 'package:contracterApp/tabview/socialWork.dart';
import 'package:contracterApp/view/workersDetails.dart';
import 'package:flutter/material.dart';
// class TabPage extends StatefulWidget {
//   @override
//   State<TabPage> createState() => _TabPageState();
// }

// class _TabPageState extends State<TabPage> {
//   List<String> jobCategories = ['CementWork', 'BuildingWork', 'SocialWork', 'Painting'];

//   List categor=[
//     Cement(),
//     Building(),
//     Social(),
//     Paint()

//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFF7C8363),
//       body: GridView.builder(
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           crossAxisSpacing: 8.0,
//           mainAxisSpacing: 8.0,
//         ),
//         itemBuilder: (context, index) {
//           return GestureDetector(
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => ListWorkers(selectedJobCategory: jobCategories[index]),
//                   ),
//               );
//             },
//             child: Card(
//               color: Color.fromARGB(31, 223, 190, 190),
//               shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(130))),
//               child: Padding(
//                 padding: const EdgeInsets.only(top: 70),
//                 child: Column(
//                   children: [
//                     Text(jobCategories[index], style: TextStyle(fontSize: 20)),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//         itemCount: jobCategories.length,
//       ),
//     );
//   }
// }
class TabPage extends StatefulWidget {
  @override
  State<TabPage> createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  List<String> jobCategories = ['CementWork', 'BuildingWork', 'SocialWork', 'Painting'];

  List categor = [
    Cement(),
    Building(),
    Social(),
    Painting(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 186, 187, 182),
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
                  builder: (context) => categor[index], // Use the corresponding page from the categor list
                ),
              );
            },
            child: Card(
              color: Color.fromARGB(31, 223, 190, 190),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(130))),
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
