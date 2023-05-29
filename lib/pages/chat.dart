
import 'package:flutter/material.dart';
import '../appBarpage.dart';

class Chat extends StatelessWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(),
      body: Center(
        child: Text("chat Page ",
          style: TextStyle(
            fontSize: 25.0,
          ),),
      ),
    );
  }
}
