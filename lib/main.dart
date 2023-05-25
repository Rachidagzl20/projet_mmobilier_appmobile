import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';

import 'package:projet_mmobilier_appmobile/home.dart';
import 'package:projet_mmobilier_appmobile/pages/login.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'pages/Start_page.dart';
import 'pages/getStartedPage.dart';

 main() => runApp(MaterialApp(
    localizationsDelegates: [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    supportedLocales: [
      const Locale('en'), // English
      const Locale('ar'), // Arabic
    ],
    routes: {
      "/": (context) => StartPage(),
      "/getstarted": (context) => GetStarted(),
      "/loginpage": (context) => LoginPage(),
      "/Home": (context) => Home(),
    },
    initialRoute: "/",
  ));

