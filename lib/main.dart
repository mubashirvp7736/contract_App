
import 'package:contracterApp/db/model/model.dart';
import 'package:contracterApp/view/splashScreen.dart';
import 'package:contracterApp/view/workersDetails.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_flutter/adapters.dart';
const save_key='';
 Future <void> main() async{
   WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
   if (!Hive.isAdapterRegistered(JobworkersAdapter().typeId)) {
     Hive.registerAdapter(JobworkersAdapter());
  }
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Splash(),
      debugShowCheckedModeBanner: false,
    );
    }
    }
