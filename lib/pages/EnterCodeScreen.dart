
import 'package:flutter/material.dart';
import 'package:projet_mmobilier_appmobile/appBarpage.dart';

class EnterCodeScreen extends StatefulWidget {
  const EnterCodeScreen({Key? key}) : super(key: key);

  @override
  State<EnterCodeScreen> createState() => _EnterCodeScreenState();
}

class _EnterCodeScreenState extends State<EnterCodeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Scaffold(
          body: Text(" EnterCodeScreen page "),
        ),
      ),
    );
  }
}
