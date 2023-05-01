import 'package:flutter/material.dart';
import '../appBarpage.dart';

class notifecation extends StatefulWidget {
  const notifecation({Key? key}) : super(key: key);

  @override
  State<notifecation> createState() => _notifecationState();
}

class _notifecationState extends State<notifecation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Center(
        child: Text("notifectaion Page ",
          style: TextStyle(
            fontSize: 25.0,
          ),),
      ),
    );
  }
}

