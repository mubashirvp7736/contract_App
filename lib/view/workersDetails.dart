
import 'dart:io';
import 'package:contracterApp/db/function/functions.dart';
import 'package:contracterApp/db/model/model.dart';
import 'package:contracterApp/view/addWorker.dart';
import 'package:contracterApp/view/details.dart';
import 'package:contracterApp/view/edit.dart';
import 'package:flutter/material.dart';


class ListWorkers extends StatefulWidget {
  final String? selectedJobCategory;

  const ListWorkers({Key? key, this.selectedJobCategory}) : super(key: key);

  @override
  _ListStudentState createState() => _ListStudentState();
}

class _ListStudentState extends State<ListWorkers> {
  TextEditingController searchController = TextEditingController();
  List<Jobworkers> workersList = [];
  List<Jobworkers> filteredworkerList = [];


  bool isSearching = false;

  @override
  void initState() {
    super.initState();
  
    getAllStud();
  }

  void filterworkers(String search) {
    if (search.isEmpty) {
      setState(() {
        filteredworkerList = List.from(workersList);
      });
    } else {
      setState(() {
        filteredworkerList = workersList
            .where((student) =>
                student.name.toLowerCase().contains(search.toLowerCase()))
            .toList();
      });
    }
  }
  @override
  Widget build(BuildContext context) {
      List<Jobworkers> allWorkers = workersList;

    // Filter workers based on the selected job category
    List<Jobworkers> filteredWorkers = allWorkers
        .where((worker) => worker.jobcategories == workersList)
        .toList();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white24,
           title: isSearching ? buildSearchField() : Text("workers List"),
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  isSearching = !isSearching;
                  if (!isSearching) {
                    searchController.clear();
                    filteredworkerList = List.from(workersList);
                  }
                });
              },
              icon: Icon(isSearching ? Icons.cancel : Icons.search),
            ),
          ],
        ),
        body: Center(
          child: isSearching
                          ? filteredworkerList.isNotEmpty
                        ? ListView.separated(
                      itemBuilder: (ctx, index) {
                        final data = filteredworkerList[index];
                        return buildStudentCard(data, index);
                      },
                      separatorBuilder: (ctx, index) {
                        return const Divider();
                      },
                      itemCount: filteredworkerList.length,
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
      controller: searchController,
      onChanged: (query) {
        filterworkers(query);
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
                    title: Text(data.name),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(data.number),
                        Text(data.age),
                        Text(data.jobcategories),
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditScreen(
                          index: index,
                          name: data.name,
                          number: data.number,
                          age: data.age,
                          jobcategories: data.jobcategories,
                          image: data.image!,
                        ),
                      ),
                    );
                  },
                  icon: Icon(Icons.edit),
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                IconButton(
                  onPressed: () {
                    deletestud(index);
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
  );
}
  Widget buildStudentList() {
    return ValueListenableBuilder(
      valueListenable: jobworkernotifier,
      builder: (BuildContext ctx, List<Jobworkers> studentlist, Widget? child) {
        workersList = studentlist;
        filteredworkerList = List.from(workersList);

        return ListView.separated(
          itemBuilder: (ctx, index) {
            final data = workersList[index];
            return buildStudentCard(data, index);
          },
          separatorBuilder: (ctx, index) {
            return const Divider();
          },
          itemCount:workersList.length,
        );
      },
    );
  }
}
