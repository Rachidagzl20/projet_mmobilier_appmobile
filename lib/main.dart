import 'package:flutter/material.dart';
import 'package:projet_mmobilier_appmobile/home.dart';
import 'package:projet_mmobilier_appmobile/pages/login.dart';
import 'pages/Start_page.dart';
import 'pages/getStartedPage.dart';
void main() => runApp( MaterialApp(

  routes: {
    "/":(context) =>StartPage(),
    "/getstarted":(context) =>GetStarted(),
    "/loginpage":(context) =>LoginPage(),
    "/Home":(context) =>Home(),
  },
  initialRoute: "/",
));