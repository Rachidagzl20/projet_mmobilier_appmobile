import 'package:flutter/material.dart';
import '../appBarpage.dart';

class ProDetailspage extends StatefulWidget {
  const ProDetailspage({Key? key}) : super(key: key);

  @override
  State<ProDetailspage> createState() => _ProDetailspageState();
}

class _ProDetailspageState extends State<ProDetailspage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Center(
        child: Text("Project Details Page ",
          style: TextStyle(
            fontSize: 25.0,
          ),),
      ),
    );
  }
}