import 'package:contracterApp/db/model/model.dart';
import 'package:contracterApp/main.dart';
import 'package:contracterApp/view/homePage.dart';
import 'package:contracterApp/view/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shared_preferences/shared_preferences.dart';

ValueNotifier<List<Jobworkers>> jobworkernotifier=ValueNotifier([]);

Future<void> getAllStud()async{
   final studentDb= await Hive.openBox<Jobworkers>("jobworker_db");
  jobworkernotifier.value.clear();
  jobworkernotifier.value.addAll(studentDb.values);
  jobworkernotifier.notifyListeners(); 
}
Future <void> addstud(Jobworkers value)async
{
  final jobworkerDb = await Hive.openBox<Jobworkers>("jobworker_db");
    await jobworkerDb.add(value);
    getAllStud();
}
Future<void> deletestud(int index)async{
  final jobworkerDb= await Hive.openBox<Jobworkers>("jobworker_db"); 
   await jobworkerDb.deleteAt(index);
  getAllStud();
}
Future<void>getstoreditems()async{
   final jobworkerDb = await Hive.openBox<Jobworkers>("jobworker_db");
   
}
 void checkLogin(BuildContext context,_username,_password)async{
  final _usernames=_username.text;
  final _passwords=_password.text;

  if(_usernames=='mubu'&& _passwords=='7736'){
    final _sharedprefe=await SharedPreferences.getInstance();
    await _sharedprefe.setBool(save_key,true);
      print('suuccessful');
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>HomeScreen()));
       }else{
    final _errormessage='username password doesnot match';
  }

  }
    Future<void> gotoScreen(context)async{
    await Future.delayed(Duration(seconds: 4));
  Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => UserLogin(),));
  }
  Future<void>checkuserlogin(context)async{
    final _sharedprefer= await SharedPreferences.getInstance();
    final _userlogin=_sharedprefer.getBool(save_key);
   if(_userlogin==null){
    UserLogin();
   }else{
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>HomeScreen()));

   }
  }
 void showPopupMenu(BuildContext context) {
    showMenu(
      context: context,
      position: RelativeRect.fromRect(
      Rect.fromPoints(
          Offset(100, 100), 
          Offset(200, 200),
        ),
        Offset.zero & MediaQuery.of(context).size
      ),
      items: [
        PopupMenuItem(
          child: ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
            },
          ),
        ),
        PopupMenuItem(
          child: ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () {
              Logout();
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => UserLogin(),), (route) => false);
            },
          ),
        ),
      ],
    );
  }
Future<void> Logout()async{
  final jobworkerDb= await Hive.openBox<Jobworkers>("jobworker_db"); 
   await jobworkerDb.clear();
  getAllStud();
}
