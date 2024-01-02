import 'dart:io';

import 'package:contracterApp/controller/addProvider.dart';
import 'package:contracterApp/controller/db_provider.dart';
import 'package:contracterApp/view/workersDetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class EditScreen extends StatefulWidget {
  final String name;
  final String number;
  final String age;
  final String jobCategories;
  final String image;
  final int index;

  EditScreen({super.key,
  required this.name,
  required this.number,
  required this.age,
  required this.jobCategories,
  required this.index, required String jobCategory, required this. image
  });

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final TextEditingController name=TextEditingController();
  final TextEditingController number=TextEditingController();
  final TextEditingController age=TextEditingController();
  final TextEditingController jobCategories=TextEditingController();
  File? selectedimage;
  String? image;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    name.text=widget.name;
    number.text=widget.number;
    age.text=widget.age;
    jobCategories.text=widget.jobCategories;
   image = widget.image != '' ? widget.image : null;
  }




  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: const Text('Edit Worker'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(40),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar( backgroundImage: image != null
                            ? FileImage(File(image!))
                            : AssetImage('assets/user.png') as ImageProvider,
                      child: IconButton(onPressed: (){
                   
                 Provider.of<Dbprovider>(context,listen: false). fromcam();
                  }, icon: Icon(Icons.add_a_photo),),radius: 60,),
                  SizedBox(height: 10,),
                  ElevatedButton.icon(onPressed: (){
                 Provider.of<Dbprovider>(context,listen: false).fromgallery();
                  }, 
                  icon:Icon(Icons.camera_alt_outlined), label:Text("Gallery")),
                  SizedBox(height: 20,),
                  TextFormField(
                    keyboardType: TextInputType.name,
                    inputFormatters:[FilteringTextInputFormatter.allow(RegExp(r'[a-zA-z\s]'))],
                    controller: name,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                      labelText: "Name",
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    controller: number,
                    decoration:  InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                      labelText: "number",
                      prefixIcon: Icon(Icons.calendar_month),
                    ),
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters:[FilteringTextInputFormatter.allow(RegExp(r'[a-zA-z\s]'))],
                    controller: age,
                    decoration:  InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                      labelText: "Age",
                      prefixIcon: Icon(Icons.book),
                    ),
                  ),
                      DropdownButtonFormField<String>(
                    value: Provider.of<Addworkers>(context).selectedJob,
                    items: ['CementWork', 'BuildingWork', 'SocialWork', 'Painting']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      Provider.of<Addworkers>(context, listen: false)
                          .selectJobCategory(newValue!);
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
              
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      await Provider.of<Dbprovider>(context,listen: false). updateStudent(widget.index);
                        Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const ListWorkers(),
      ));
   
                    },
                    child: const Text("Update"),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
  }
   
}

