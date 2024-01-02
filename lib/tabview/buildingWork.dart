
import 'dart:io';
import 'package:contracterApp/controller/db_provider.dart';
import 'package:contracterApp/controller/Workerde.dart';
import 'package:contracterApp/db/model/model.dart';
import 'package:contracterApp/controller/tabview.dart';
import 'package:contracterApp/view/details.dart';
import 'package:contracterApp/view/edit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Building extends StatefulWidget {
  final String? selectedJobCategory;
  const Building({Key? key, this.selectedJobCategory}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _ListStudentState createState() => _ListStudentState();
}

class _ListStudentState extends State<Building> {
  String ? image;
  @override
  void initState() {
    super.initState(); 
   Provider.of<Dbprovider>(context,listen: false). getAllStud();
  }
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white24,
           title: Provider.of<Tabviewdetail>(context,listen: false).isSearching ? buildSearchField() : Text("workers List"),
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              onPressed: () {
                Provider.of<Tabviewdetail>(context,listen: false).serachh();
              },
              icon: Icon(Provider.of<Tabviewdetail>(context).isSearching ? Icons.cancel : Icons.search),
            ),
          ],
        ),
        body: Center(
          child: Provider.of<Tabviewdetail>(context,listen: false).isSearching 
                          ?Provider.of<Tabviewdetail>(context).filteredworkerList.isNotEmpty
                        ? ListView.separated(
                      itemBuilder: (ctx, index) {
                        final data = Provider.of<Tabviewdetail>(context,listen: false).filteredworkerList[index];
                        return buildStudentCard(data, index);
                      },
                      separatorBuilder: (ctx, index) {
                        return const Divider();
                      },
                      itemCount:Provider.of<Tabviewdetail>(context,listen: false).filteredworkerList.length,
                    )
                  : Center(
                      child: Text("No results found."),
                    )
              : buildStudentList(),
        ),
        backgroundColor: const Color.fromARGB(255, 148, 148, 148),
      ),
    );
  }
  Widget buildSearchField() {
    return TextField(
      controller:Provider.of<Tabviewdetail>(context,listen: false).searchController,
      onChanged: (query) {
        Provider.of<Tabviewdetail>(context,listen: false).filterworkers(query);
      },
      autofocus: true,
      style: TextStyle(
        color: Colors.white, 
      ),
      decoration: InputDecoration(
        hintText: "Search students...",
        hintStyle: TextStyle(
          color: Colors.white.withOpacity(0.7), 
        ),
        border: InputBorder.none,
      ),
    );
  }
Widget buildStudentCard(Jobworkers data, int index) {
  return GestureDetector(
    onTap: () {
       Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return Details(name: data.name, number: data.number, age:data. age, jobcategories:data. jobcategories,image: data.image!,);
      },));
    },
    child: Padding(
      padding: EdgeInsets.all(12),
      child: Card(
        color: Color.fromARGB(255, 241, 227, 227),
        child: Container(
          padding: EdgeInsets.all(15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                maxRadius: 30,
                backgroundColor: Colors.black,
                backgroundImage: FileImage(File(data.image!)),
              ),
              SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Text('Name: ${data.name}',style:TextStyle(fontStyle: FontStyle.italic) ,),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('MOB: ${data.number}'),
                          Text('Age: ${data.age}'),
                          Text( 'Job:${data.jobcategories}'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  IconButton(
                    onPressed: () { 
                      showModalBottomSheet(context: context, builder: (context) {
                        return EditScreen(name: data.name, number:data. number, age:data.age, jobCategory:data. jobcategories, index: index, image:data.image!, jobCategories: '',);
                      },);
                    },
                    icon: Icon(Icons.edit),
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                  IconButton(
                    onPressed: () {
                      showDialog(context: context,
                       builder:(context) {
                         return AlertDialog(
                          title: Text('Are you sure want to delete'),
                          actions: [
                            TextButton(onPressed: (){
                              Navigator.pop(context);
                            }, child:Text('close')),
                            TextButton(onPressed: (){
                             Provider.of<Dbprovider>(context,listen: false).deletestud(index);
                              Navigator.pop(context);
                            }, child: Text('Delete'))
                          ],
                         );
                       },);
                     },
                    icon: Icon(Icons.delete),
                    color: Colors.red,
                     ),
                   ],
                 ),
               ],
             ),
          ),
        ),
      ),
    );
  }
  Widget buildStudentList() {
 
   return
    Consumer<Dbprovider>(
  builder: (context, dbvalue, child) {
    final filteredWorkerList = dbvalue.workersList
        .where((worker) => worker.jobcategories.contains('BuildingWork'))
        .toList();
    
    Provider.of<Workerdetail>(context).filteredworkerList = List.from(filteredWorkerList);

    return ListView.separated(
      itemBuilder: (ctx, index) {
        final data = filteredWorkerList[index];
        return buildStudentCard(data, index); // Assuming you have a function called buildWorkerCard to build each worker card.
      },
      separatorBuilder: (ctx, index) {
        return const Divider();
      },
      itemCount: filteredWorkerList.length,
    );
  },
);

  }
}
