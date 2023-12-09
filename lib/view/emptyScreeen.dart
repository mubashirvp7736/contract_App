
import 'package:flutter/material.dart';

Widget home(){
   return Scaffold(
    appBar: AppBar(
      title: Text('Home'),
    ),
    body: Center(
      child: Text('Home details',style: TextStyle(fontSize: 40),),
    ),
   );
}
Widget account(){
   return Scaffold(
    appBar: AppBar(
      title: Text('Account'),
    ),    body: Center(
      child: Text('Account details',style: TextStyle(fontSize: 40),),
    ),
   );
}
Widget Settings(){
   return Scaffold(
    appBar: AppBar(
      title: Text('Settings'),
    ),    body: Center(
      child: Text('Setting details',style: TextStyle(fontSize: 40),),
    ),
  );

}
Widget Aboute(){
   return Scaffold(
    backgroundColor: Colors.grey,
    appBar: AppBar(
      title: Text('About'),
    ),    body:Padding(
      padding: const EdgeInsets.all(18),
      child: Column(
        children: [
          Text('User Authentication:',style: TextStyle(fontSize: 23,decoration: TextDecoration.underline),),
          Text('-> Contractors should be able to create accounts and log in securely.'),
          SizedBox(height: 6,),
          Text('Dashboard:',style: TextStyle(fontSize: 23),),
          Text('->Upon logging in, the contractor is greeted with a dashboard.'),
         Text('->The dashboard displays a summary of the total number of workers and other relevant information.'),
         SizedBox(height: 6,),
         Text('Add Workers:',style: TextStyle(fontSize: 23),),
         Text('->Contractors can add new workers to their team.'),
       Text('->When adding a worker, the contractor inputs details such as name, age, phone number, job category, and an optional profile picture.'),
      Text('->The app allows contractors to categorize workers based on job types e.g., cement work, building work, etc'),
      SizedBox(height: 6,),
      Text('Error Handling',style: TextStyle(fontSize: 23),),
      Text('Handle errors gracefully. For example, if a worker can'),
      Text( 'added due to validation errors or if theres an issue with local storage, provide appropriate error messages to the user.')
        ],
      ),
    )
    
     );


}