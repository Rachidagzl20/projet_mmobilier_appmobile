import 'package:flutter/material.dart';
import '../appBarpage.dart';

class Project extends StatefulWidget {
  const Project({Key? key}) : super(key: key);

  @override
  State<Project> createState() => _ProjectState();
}

class _ProjectState extends State<Project> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Center(
        child: Text("Project Page ",
          style: TextStyle(
            fontSize: 25.0,
          ),),
      ),
    );
  }
}

