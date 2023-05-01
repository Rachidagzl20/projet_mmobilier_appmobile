import 'package:flutter/material.dart';
import 'package:projet_mmobilier_appmobile/home.dart';
import 'package:projet_mmobilier_appmobile/utils/app_color.dart';
import 'package:projet_mmobilier_appmobile/utils/app_color.dart';
import 'package:projet_mmobilier_appmobile/utils/app_color.dart';
import 'package:projet_mmobilier_appmobile/utils/app_color.dart';
import 'package:projet_mmobilier_appmobile/utils/app_color.dart';
import 'package:projet_mmobilier_appmobile/utils/app_color.dart';
import 'package:projet_mmobilier_appmobile/utils/app_color.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _rememberMe = false;

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
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
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
                padding: const EdgeInsets.only(top:1.0),
                child: Image.asset(
                  'assets/img_Auth.png',
                  width: 250,
                  height: 250,
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 40.0),
                child: Expanded(
                  child: Column(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.person,
                              color: AppColors.primary,
                            ),
                            labelText: 'Email',
                            hintText: 'Enter your email',


                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(width: 1, color:AppColors.primary )),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          decoration: InputDecoration(
                             //<-- SEE HERE
                            prefixIcon: Icon(
                              Icons.lock,
                              color: AppColors.primary,
                            ),
                            labelText: 'Password',
                            hintText: 'Enter your password',
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(width: 1, color:AppColors.primary )),
                          ),
                          obscureText: true,
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: false,
                                onChanged: (value) {},
                              ),
                              Text("Remember me",
                              style: TextStyle(
                                color: Colors.blue,
                              ),),
                            ],
                          ),
                          InkWell(
                            onTap: () {},
                            child: Text(
                              "Forgot password ?",
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(

                        onPressed: () {},
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text("Connexion",
                            style: TextStyle(

                              fontSize: 20.0,

                            ), textAlign: TextAlign.center,),

                            SizedBox(width: 20.0),



                        ],),


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
                            EdgeInsets.symmetric(horizontal: 84, vertical: 8),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),

                      ElevatedButton(

                        onPressed: () {},
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text("Contacter support",
                              style: TextStyle(
                                fontSize: 20.0,
                              ),),
                            SizedBox(width: 0.0),



                          ],),


                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Color(0xFF367CFF),
                          ),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100.0),
                            ),
                          ),
                          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                            EdgeInsets.symmetric(horizontal: 60, vertical: 8),
                          ),
                        ),
                      ),
                    ],
                  ),
                      SizedBox(height: 10),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Home(), // replace LoginPage with your actual login page widget
                            ),
                          );
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                          ),
                        ),
                      ),
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
