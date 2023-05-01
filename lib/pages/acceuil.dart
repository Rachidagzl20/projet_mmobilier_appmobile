
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projet_mmobilier_appmobile/appBarpage.dart';

class myacceuil extends StatefulWidget {
  const myacceuil({Key? key}) : super(key: key);

  @override
  State<myacceuil> createState() => _myacceuilState();
}

class _myacceuilState extends State<myacceuil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Center(
        child: Text("Accueil Page ",
        style: TextStyle(
          fontSize: 25.0,
        ),),
      ),
    );
  }
}