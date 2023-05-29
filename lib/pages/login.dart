// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:projet_mmobilier_appmobile/home.dart';
import 'package:projet_mmobilier_appmobile/utils/app_color.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'forgot_password_screen_1.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  //login Function
  Future<void> _login() async {
    String username = _usernameController.text;
    String password = _passwordController.text;

    // Create the login request body
    Map<String, String> body = {
      'username': username,
      'password': password,
    };

    // Make the HTTP POST request to your Node.js server
    Uri url = Uri.parse('http://192.168.137.1:3000/auth/login');
    http.Response response = await http.post(url, body: body);

    // Handle the response
    if (response.statusCode == 200) {
      // Login success
      print('Login success');
      String data= response.body;
      Map<String, dynamic> decodedToken = jsonDecode(data);
      String email = decodedToken['email'];
      String userID = decodedToken['userID'];
      String nomComplet = decodedToken['nomComplet'];
      String adresse = decodedToken['adresse'];
      String image = decodedToken['image'];
      String CIN = decodedToken['CIN'];
      String telephone = decodedToken['telephone'];

      // Save the authentication token securely
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('email', email);
      prefs.setString('nomComplet', nomComplet);
      prefs.setString('adresse', adresse);
      prefs.setString('image', image);
      prefs.setString('CIN', CIN);
      prefs.setString('userID', userID);
      prefs.setString('telephone', telephone);


      // Retrieve the stored token

      // Compare the stored token with the response body
      if (data == response.body) {
        print('Token stored successfully: $userID');


      } else {
        print('Failed to store token');
      }
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Home(),
        ),
      );
    } else if (response.statusCode == 403) {
      // Login failed, show error pop-up
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('Invalid username or password'),
            actions: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
  // Button Support
  void openWhatsApp() async {
    String phoneNumber = '0689675163'; // WhatsApp phone number
    String message = 'Hello, I need support!';

    String url = 'https://wa.me/$phoneNumber?text=${Uri.encodeComponent(message)}';

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch WhatsApp.';
    }
  }

  bool _rememberMe = false;
  bool _showPassword = false;
  //show visibility password
  void _toggleVisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        reverse: true,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 37.0),
                child: Text(
                  "AUTHENTIFICATION",
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 2.0),
                child: Image.asset(
                  'assets/img_Auth.png',
                  width: 280,
                  height: 280,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 40.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(right: 200.0),
                            child: Text(
                              "Nom d’utilisateur",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                          const SizedBox(height: 3),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15, 1, 15, 0),
                            child: Theme(
                              data: Theme.of(context).copyWith(
                                inputDecorationTheme: InputDecorationTheme(

                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: const BorderSide(width: 1, color: AppColors.primary),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: const BorderSide(width: 1, color: AppColors.accent)),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: const BorderSide(color: Colors.red, width: 1),
                                  ),
                                ),
                              ),
                              child: TextFormField(
                                controller: _usernameController,
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.person,
                                    color: AppColors.primary,
                                  ),
                                  hintText: 'saisir votre nom d’utilisateur',
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "this field is required";
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          const SizedBox(height: 6),
                          const Padding(
                            padding: EdgeInsets.only(right: 225.0),
                            child: Text(
                              "Mot de passe",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                          const SizedBox(height: 3),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15.0, 0, 15.0, 15.0),
                            child: Theme(
                              data: Theme.of(context).copyWith(
                                inputDecorationTheme: InputDecorationTheme(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: const BorderSide(width: 1, color: AppColors.primary)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: const BorderSide(width: 1, color: AppColors.accent)),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: const BorderSide(color: Colors.red, width: 1),
                                  ),
                                ),
                              ),
                              child: TextFormField(
                                controller: _passwordController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "this field is required";
                                  }
                                  return null;
                                },
                                obscureText: !_showPassword,
                                cursorColor: Colors.blueAccent,
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(
                                    Icons.lock,
                                    color: AppColors.primary,
                                  ),
                                  hintText: '*********************',
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      _toggleVisibility();
                                    },
                                    child: Icon(
                                      _showPassword ? Icons.visibility : Icons.visibility_off,
                                      color: AppColors.primary,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                    value: _rememberMe,
                                    onChanged: (value) {
                                      setState(() {
                                        _rememberMe = value!;
                                      });
                                    },
                                  ),
                                  const Text(
                                    "REMEMBER ME",
                                    style: TextStyle(
                                      color: AppColors.primary,
                                    ),
                                  ),
                                ],
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ResetPasswordScreen(),
                                    ),
                                  );
                                },
                                child: const Text(
                                  "Forgot password ?",
                                  style: TextStyle(
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              _login();
                              if (_formKey.currentState?.validate() == true) {
                                print("ok");
                              } else {
                                print("not okey");
                              }
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                AppColors.primary,
                              ),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100.0),
                                ),
                              ),
                              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                                const EdgeInsets.symmetric(horizontal: 90, vertical: 14),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Text(
                                  "Connexion",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(width: 20.0),
                              ],
                            ),
                          ),
                          const SizedBox(height: 15),
                          ElevatedButton(
                            onPressed: openWhatsApp,
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                AppColors.accent,
                              ),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100.0),
                                ),
                              ),
                              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                                const EdgeInsets.symmetric(horizontal: 70, vertical: 14),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Text(
                                  "Contacter support",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                  ),
                                ),
                                SizedBox(width: 0.0),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
