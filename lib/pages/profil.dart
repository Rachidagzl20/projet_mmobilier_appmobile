
import 'package:flutter/material.dart';
import '../appBarpage.dart';

class Profil extends StatefulWidget {
  const Profil({Key? key}) : super(key: key);

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Center(
        child: Text("Profil Page ",
          style: TextStyle(
            fontSize: 25.0,
          ),),
      ),
    );
  }
}