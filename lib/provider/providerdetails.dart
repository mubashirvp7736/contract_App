// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class providerDemo with ChangeNotifier{
//   selectedjob(){
//   String? _selectedJobCategory;
//   notifyListeners();

// }
//   images(ImageSource source){
    
//   final ImagePicker imagePicker=ImagePicker();
//   File? picked;
  
//    getimage() async {
//     var img = await imagePicker.pickImage(source: ImageSource.gallery);
//         picked = File(img!.path);
//         notifyListeners();
//   }
// }

// workedet(){
 
//   bool isSearching = false; 
// }
// }
import 'dart:io';
import 'package:contracterApp/db/model/model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProviderDemo with ChangeNotifier {
  String? _selectedJobCategory;
  File? _picked;

  String? get selectedJob => _selectedJobCategory;
  File? get pickedImage => _picked;

  void selectJobCategory(String newValue) {
    _selectedJobCategory = newValue;
    notifyListeners();
  }

  Future<void> pickImage(ImageSource source) async {
    final ImagePicker imagePicker = ImagePicker();
    var img = await imagePicker.pickImage(source: source);
    _picked = File(img?.path ?? '');
    notifyListeners();
  }

  
  List<Jobworkers> filteredworkerList = [];
  List<Jobworkers> workersList = [];
  void filterworkers(String search) {
    
    if (search.isEmpty) {
        filteredworkerList = List.from(workersList);
        notifyListeners();
    
    }else{
        filteredworkerList = workersList
            .where((student) =>
                student.name.toLowerCase().contains(search.toLowerCase()))
            .toList();
            notifyListeners();
      }
    }
    
  bool  isSearching = false;
  
   TextEditingController searchController = TextEditingController();
   void serachh(){
    isSearching = !isSearching;
        if (!isSearching) {
          searchController.clear();
         filteredworkerList = List.from(workersList);
         notifyListeners();
        }
        notifyListeners();
   }
  }
