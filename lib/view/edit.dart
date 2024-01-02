// import 'dart:io';

// import 'package:contracterApp/db/function/functions.dart';
// import 'package:contracterApp/db/model/model.dart';
// import 'package:contracterApp/view/workersDetails.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:hive/hive.dart';
// import 'package:image_picker/image_picker.dart';

// class EditScreen extends StatefulWidget {
//   final String name;
//   final String number;
//   final String age ;
//   final String jobcategories;
//   final String image;
//   final int index;

//   const EditScreen({super.key, 

//     required this.name,
//     required this.age,
//     required this.number,
//     required this.jobcategories,
//     required this.image,
//     required this.index,

//   });

//   @override
//   State<EditScreen> createState() => _EditScreenState();
// }

// class _EditScreenState extends State<EditScreen> {
//   final TextEditingController _nameController = TextEditingController();
//     final TextEditingController _numberController = TextEditingController();
//   final TextEditingController _ageController = TextEditingController();
//   final TextEditingController _jobController = TextEditingController();

//   File? selectimage;

//   @override
//   void initState() {
//     super.initState();
//     _nameController.text = widget.name;
//         _numberController.text = widget.number;
//     _ageController.text = widget.age;
//     _jobController.text = widget.jobcategories;
//     selectimage=widget.image!= null ? File(widget.image):null;
//   }
//   Future<void> updateStudent(int index) async {
//     final studentDb = await Hive.openBox<Jobworkers>("student_db");

//     if (index >= 0 && index < studentDb.length) {
//       final updatedStudent = Jobworkers(
//         name: _nameController.text,
//         number: _numberController.text,
//         age: _ageController.text,
//         jobcategories: _jobController.text,

//         image: selectimage!.path,
//       );
//       await studentDb.putAt(index, updatedStudent);
//       getAllStud();

//       Navigator.of(context).push(MaterialPageRoute(
//         builder: (context) => const ListWorkers(),
//       ));
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text('Edit Student'),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(40),
//           child: SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 25),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   CircleAvatar(backgroundColor: Colors.black,child: IconButton(onPressed: (){
//                     fromcam();
//                   }, icon: Icon(Icons.add_a_photo),),radius: 60,),
//                   SizedBox(height: 10,),
//                   ElevatedButton.icon(onPressed: (){
//                      fromgallery();
//                   }, 
//                   icon:Icon(Icons.camera_alt_outlined), label:Text("Gallery")),
//                   SizedBox(height: 20,),
//                   TextFormField(
//                     keyboardType: TextInputType.name,
//                     inputFormatters:[FilteringTextInputFormatter.allow(RegExp(r'[a-zA-z\s]'))],
//                     controller: _nameController,
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
//                       labelText: "Name",
//                       prefixIcon: Icon(Icons.person),
//                     ),
//                   ),
//                   SizedBox(height: 10,),
//                    TextFormField(
//                     keyboardType: TextInputType.number,
//                     inputFormatters: [FilteringTextInputFormatter.digitsOnly],
//                     controller: _numberController,
//                     decoration:  InputDecoration(
//                       border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
//                       labelText: "phone",
//                       prefixText: "+91",
//                       prefixIcon: Icon(Icons.phone),
//                     ),
//                   ),
                  
//                   TextFormField(
//                     keyboardType: TextInputType.number,
//                     inputFormatters: [FilteringTextInputFormatter.digitsOnly],
//                     controller: _ageController,
//                     decoration:  InputDecoration(
//                       border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
//                       labelText: "Age",
//                       prefixIcon: Icon(Icons.calendar_month),
//                     ),
//                   ),
//                   SizedBox(height: 10,),
//                   TextFormField(
//                     keyboardType: TextInputType.name,
//                     inputFormatters:[FilteringTextInputFormatter.allow(RegExp(r'[a-zA-z\s]'))],
//                     controller: _jobController,
//                     decoration:  InputDecoration(
//                       border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
//                       labelText: "Course",
//                       prefixIcon: Icon(Icons.book),
//                     ),
//                   ),
//                   SizedBox(height: 10,),
//                   const SizedBox(height: 20),
//                   ElevatedButton(
//                     onPressed: () async {
//                       await updateStudent(widget.index);
//                     },
//                     child: const Text("Update"),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//     fromgallery() async {
//     final returnedimage =
//         await ImagePicker().pickImage(source: ImageSource.gallery);

//     setState(() {
//       selectimage = File(returnedimage!.path);
//     });
//   }
// fromcam() async {
//     final returnedimage =
//         await ImagePicker().pickImage(source: ImageSource.camera);
//     setState(() {
//       selectimage = File(returnedimage!.path);
//     });
//   }
// }

// import 'dart:io';

// import 'package:contracterApp/db/function/functions.dart';
// import 'package:contracterApp/db/model/model.dart';
// import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:image_picker/image_picker.dart';

//   final _namecontroller =TextEditingController();
//   final _numbercontroller=TextEditingController();
//   final _ageController =TextEditingController();
//   final _jobcategories=TextEditingController();

//   String ? image;
// class editscreen extends StatefulWidget {
//   final String name;
//   final String number;
//   final String age;
//   final int index;
//   final String jobcategorie;
//   dynamic image;

//   editscreen({super.key, 
//   required this.name, 
//   required this.number, 
//   required this.age, 
//   required this.jobcategorie,
//   required this.index, 
//   required this.image});

//   @override
//   State<editscreen> createState() => _editscreenState();
// }

// class _editscreenState extends State<editscreen> {
 

//   @override
//   void initState() {
//     super.initState();

//     _namecontroller.text = widget.name;
//     _numbercontroller.text = widget.number;
//     _ageController.text = widget.age;
//     _jobcategories.text = widget.jobcategorie;
//     image = widget.image != '' ? widget.image : null;
//   }

//   String? _selectedJobCategory;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.purple[50],
//       body: SingleChildScrollView(
//         scrollDirection: Axis.vertical,
//         child: Form(
//           child: Column(
//             children: [
//               Padding(
//                 padding: EdgeInsets.all(20),
//                 child: Column(
//                   children: [
//                     GestureDetector(
//                       child: CircleAvatar(
//                         child: Icon(Icons.add_a_photo),
//                         radius: 50,
//                         backgroundImage: image!=null
//                         ? FileImage(File(image!)):
//                         AssetImage('assets/person.png') as ImageProvider,
//                       ),
//                       onTap:() {
//                       _editimage();
//                       },
//                       onDoubleTap: () => _imageEditCam(),
//                     ),
//                     SizedBox(height: 20,),
//                     TextFormField(
//                       controller: _namecontroller,
//                       decoration: InputDecoration(
//                         prefixIcon: Icon(Icons.person),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.all(Radius.circular(20)),
//                         ),
//                         hintText: "Your Name",
//                         labelText: "Name",
//                       ),
                      
//                     ),
//                     SizedBox(height: 20,),
//                     TextFormField(
//                       maxLength: 10,
//                       controller: _numbercontroller,
//                       keyboardType: TextInputType.number,
//                       decoration: InputDecoration(
//                         prefixIcon: Icon(Icons.calendar_month),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.all(Radius.circular(20)),
//                         ),
//                         labelText: "number",
//                         hintText: "Your Age",
//                       ),
                      
//                     ),
//                     SizedBox(height: 15,),
//                     TextFormField(
//                       controller: _ageController,
//                       decoration: InputDecoration(
//                         prefixIcon: Icon(Icons.class_),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.all(Radius.circular(20)),
//                         ),
//                         labelText: "Age",
//                         hintText: "Your Class",
//                       ),
                      
//                     ),
//                     SizedBox(height: 20,),
//                     DropdownButtonFormField<String>(
//         value: _selectedJobCategory,
//         items: ['CementWork', 'BuildingWork', 'SocialWork', 'Painting']
//         .map<DropdownMenuItem<String>>((String value) {
//      return DropdownMenuItem<String>(
//       value: value,
//       child: Text(value),
//      );
//     }).toList(),
//     onChanged: (String? newValue) {
//     setState(() {
//       _selectedJobCategory = newValue;
//     });
//     },
//     decoration: InputDecoration(
//     border: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(20),
//     ),
//     labelText: "Job Categories",
//     hintText: "Select your job category",
//     prefixIcon: Icon(Icons.work),
//   ),
//   validator: (value) {
//     if (value == null || value.isEmpty) {
//       return 'Please select a job category';
//       } else {
//       return null;
//            }
//       },
//    ),
//    SizedBox(height: 10,),
//     ElevatedButton.icon(onPressed: (){ 
//                      Navigator.pop(context);
//                      updatestudent(widget.index);
//                     }, icon: Icon(Icons.save), label: Text("UPDATE"))
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//   Future _editimage()async{
//     final returnImage = await ImagePicker().pickImage(source: ImageSource.gallery);
//     if(returnImage == null){
//       return;
//     }
//     setState(() {
//       image = returnImage.path;
//     });
//   }
//   _imageEditCam()async{
//     final returnImage = await ImagePicker().pickImage(source: ImageSource.gallery);
//     if(returnImage == null){
//       return;
//     }
//     setState(() {
//       image = returnImage.path;
//     });
//   }
//   Future<void> updatestudent(int index)async{
//     final jobworkerDb=await Hive.openBox<Jobworkers>('student_db');
//       final stdupdate = Jobworkers(
//         name: _namecontroller.text,
//          number:_numbercontroller.text ,
//          age:_ageController.text ,
//          jobcategories:_selectedJobCategory??'',
//          image: image,
//         );
//         await jobworkerDb.putAt(index, stdupdate);
//         getAllStud();
//   }
// }
// import 'dart:io';

// import 'package:contracterApp/db/function/functions.dart';
// import 'package:contracterApp/db/model/model.dart';
// import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:image_picker/image_picker.dart';

// final _namecontroller = TextEditingController();
// final _numbercontroller = TextEditingController();
// final _ageController = TextEditingController();
// final _jobcategories = TextEditingController();

// String? image;

// class editscreen extends StatefulWidget {
//   final String name;
//   final String number;
//   final String age;
//   final int index;
//   final String jobcategorie;
//   dynamic image;

//   editscreen({
//     super.key,
//     required this.name,
//     required this.number,
//     required this.age,
//     required this.jobcategorie,
//     required this.index,
//     required this.image,
//   });

//   @override
//   State<editscreen> createState() => _editscreenState();
// }

// class _editscreenState extends State<editscreen> {
//   @override
//   void initState() {
//     super.initState();

//     _namecontroller.text = widget.name;
//     _numbercontroller.text = widget.number;
//     _ageController.text = widget.age;
//     _jobcategories.text = widget.jobcategorie;
//     image = widget.image != '' ? widget.image : null;
//   }

//   String? _selectedJobCategory;

//   @override
//   Widget build(BuildContext context) {
//     getAllStud();
//     return Scaffold(
//       backgroundColor: Colors.purple[50],
//       body: SingleChildScrollView(
//         scrollDirection: Axis.vertical,
//         child: Form(
//           child: Column(
//             children: [
//               Padding(
//                 padding: EdgeInsets.all(20),
//                 child: Column(
//                   children: [
//                     GestureDetector(
//                       child: CircleAvatar(
//                         child: Icon(Icons.add_a_photo),
//                         radius: 50,
//                         backgroundImage: image != null
//                             ? FileImage(File(image!))
//                             : AssetImage('assets/person.png') as ImageProvider,
//                       ),
//                       onTap: () {
//                         _editimage();
//                       },
//                       onDoubleTap: () => _imageEditCam(),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     TextFormField(
//                       controller: _namecontroller,
//                       decoration: InputDecoration(
//                         prefixIcon: Icon(Icons.person),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.all(Radius.circular(20)),
//                         ),
//                         hintText: "Your Name",
//                         labelText: "Name",
//                       ),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     TextFormField(
//                       maxLength: 10,
//                       controller: _numbercontroller,
//                       keyboardType: TextInputType.number,
//                       decoration: InputDecoration(
//                         prefixIcon: Icon(Icons.calendar_month),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.all(Radius.circular(20)),
//                         ),
//                         labelText: "number",
//                         hintText: "Your Age",
//                       ),
//                     ),
//                     SizedBox(
//                       height: 15,
//                     ),
//                     TextFormField(
//                       controller: _ageController,
//                       decoration: InputDecoration(
//                         prefixIcon: Icon(Icons.class_),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.all(Radius.circular(20)),
//                         ),
//                         labelText: "Age",
//                         hintText: "Your Class",
//                       ),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     DropdownButtonFormField<String>(
//                       value: _jobcategories.text,
//                       items: ['CementWork', 'BuildingWork', 'SocialWork', 'Painting']
//                           .map<DropdownMenuItem<String>>((String value) {
//                         return DropdownMenuItem<String>(
//                           value: value,
//                           child: Text(value),
//                         );
//                       }).toList(),
//                       onChanged: (String? newValue) {
//                         setState(() {
//                           _jobcategories.text = newValue ?? '';
//                         });
//                       },
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         labelText: "Job Categories",
//                         hintText: "Select your job category",
//                         prefixIcon: Icon(Icons.work),
//                       ),
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please select a job category';
//                         } else {
//                           return null;
//                         }
//                       },
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     ElevatedButton.icon(
//                         onPressed: () {
//                           Navigator.pop(context);
//                           updatestudent(widget.index);
//                         },
//                         icon: Icon(Icons.save),
//                         label: Text("UPDATE"))
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Future _editimage() async {
//     final returnImage = await ImagePicker().pickImage(source: ImageSource.gallery);
//     if (returnImage == null) {
//       return;
//     }
//     setState(() {
//       image = returnImage.path;
//     });
//   }

//   _imageEditCam() async {
//     final returnImage = await ImagePicker().pickImage(source: ImageSource.gallery);
//     if (returnImage == null) {
//       return;
//     }
//     setState(() {
//       image = returnImage.path;
//     });
//   }

//   Future<void> updatestudent(int index) async {
//     final jobworkerDb = await Hive.openBox<Jobworkers>('student_db');
//     final stdupdate = Jobworkers(
//       name: _namecontroller.text,
//       number: _numbercontroller.text,
//       age: _ageController.text,
//       jobcategories: _jobcategories.text,
//       image: image,
//     );
//     await jobworkerDb.putAt(index, stdupdate);
//     getAllStud();
//   }
// }
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:contracterApp/controller/db_provider.dart';
import 'package:contracterApp/db/model/model.dart';
import 'package:provider/provider.dart';

final _nameController = TextEditingController();
final _numberController = TextEditingController();
final _ageController = TextEditingController();
final _jobCategoriesController = TextEditingController();

String? image;

// ignore: must_be_immutable
class EditScreen extends StatefulWidget {
  final String name;
  final String number;
  final String age;
  final int index;
  final String jobCategory;
  dynamic image;

  EditScreen({
    super.key,
    required this.name,
    required this.number,
    required this.age,
    required this.jobCategory,
    required this.index,
    required this.image,
  });

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  @override
  void initState() {
    super.initState();

    _nameController.text = widget.name;
    _numberController.text = widget.number;
    _ageController.text = widget.age;
    _jobCategoriesController.text = widget.jobCategory;
    image = widget.image != '' ? widget.image : null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[50],
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Form(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    GestureDetector(
                      child: CircleAvatar(
                        child: Icon(Icons.add_a_photo),
                        radius: 50,
                        backgroundImage: image != null
                            ? FileImage(File(image!))
                            : AssetImage('assets/person.png') as ImageProvider,
                      ),
                      onTap: () {
                        _editImage();
                      },
                      onDoubleTap: () => _imageEditCam(),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        hintText: "Your Name",
                        labelText: "Name",
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      maxLength: 10,
                      controller: _numberController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.calendar_month),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        labelText: "Number",
                        hintText: "Your Number",
                      ),
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      controller: _ageController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.class_),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        labelText: "Age",
                        hintText: "Your Age",
                      ),
                    ),
                    SizedBox(height: 20),
                    DropdownButtonFormField<String>(
                      value: _jobCategoriesController.text,
                      items: ['CementWork', 'BuildingWork', 'SocialWork', 'Painting']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _jobCategoriesController.text = newValue ?? '';
                        });
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        labelText: "Job Categories",
                        hintText: "Select your job category",
                        prefixIcon: Icon(Icons.work),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select a job category';
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(height: 10),
                    ElevatedButton.icon(
                        onPressed: () {
                          Navigator.pop(context);
                          updateStudent(widget.index);
                        },
                        icon: Icon(Icons.save),
                        label: Text("UPDATE"))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future _editImage() async {
    final returnImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) {
      return;
    }
    setState(() {
      image = returnImage.path;
    });
  }

  _imageEditCam() async {
    final returnImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) {
      return;
    }
    setState(() {
      image = returnImage.path;
    });
  }

  Future<void> updateStudent(int index) async {
    final studentDb = await Hive.openBox<Jobworkers>('student_db');
    final updatedStudent = Jobworkers(
      name: _nameController.text,
      number: _numberController.text,
      age: _ageController.text,
      jobcategories: _jobCategoriesController.text,
      image: image,
    );
    await studentDb.putAt(index, updatedStudent);
    Provider.of<Dbprovider>(context,listen: false).getAllStud();
  }
}
