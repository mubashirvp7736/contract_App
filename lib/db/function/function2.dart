
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import'package:contracterApp/db/model/model2.dart';
ValueNotifier<List<Jobworker>> jobworkernotifier=ValueNotifier([]);

Future<void> getAllStud()async{
   final studentDb= await Hive.openBox<Jobworker>("jobworker_db");
  jobworkernotifier.value.clear();
  jobworkernotifier.value.addAll(studentDb.values);
  jobworkernotifier.notifyListeners(); 
}
Future <void> addstud(Jobworker value)async
{
  final jobworkerDb = await Hive.openBox<Jobworker>("jobworker_db");
    await jobworkerDb.add(value);
    getAllStud();
}
Future<void> deletestud(int index)async{
  final jobworkerDb= await Hive.openBox<Jobworker>("jobworker_db"); 
   await jobworkerDb.deleteAt(index);
  getAllStud();
}
Future<void>getstoreditems()async{
   final jobworkerDb = await Hive.openBox<Jobworker>("jobworker_db");
   
}
