import 'package:flutter/material.dart';
import 'package:projet_mmobilier_appmobile/home.dart';
import 'package:projet_mmobilier_appmobile/utils/app_color.dart';


import 'change_password.dart';
import 'forgot_password_screen_1.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();

}

class _LoginPageState extends State<LoginPage> {
  bool _rememberMe = false;
  bool _showPassword = false;
  void _togglevisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
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
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
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
                        padding: const EdgeInsets.only(right: 200.0),
                        child: Text(
                          "Nom d’utilisateur",
                          style: TextStyle(
                            color: Colors.black,

                          ),
                        ),
                      ),
                      SizedBox(height: 3,),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 1, 15, 0),
                        child: Theme(
                          data: Theme.of(context).copyWith(
                            inputDecorationTheme: InputDecorationTheme(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(width: 1, color:AppColors.primary ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(width: 1, color:AppColors.accent )
                              ),
                            ),
                          ),
                          child: TextFormField(

                            decoration: InputDecoration(

                              prefixIcon: Icon(
                                Icons.person,
                                color: AppColors.primary,
                              ),
                              hintText: 'saisir votre nom d’utilisateur',

                            ),
                            validator: (value) {
                              if(value != null && value.isEmpty) {
                                return 'Please enter your Username';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 6),
                      Padding(
                        padding: const EdgeInsets.only(right: 225.0),
                        child: Text(
                          "Mot de passe",
                          style: TextStyle(
                            color: Colors.black,

                          ),
                        ),
                      ),
                      SizedBox(height: 3,),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15.0, 0, 15.0, 15.0),
                        child: Theme(
                          data: Theme.of(context).copyWith(
                            inputDecorationTheme: InputDecorationTheme(
                              enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: BorderSide(width: 1, color:AppColors.primary ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(width: 1, color:AppColors.accent )
                              ),
                            ),
                          ),
                          child: TextFormField(
                            obscureText: !_showPassword,
                            cursorColor: Colors.blueAccent,
                            decoration: InputDecoration(

                              prefixIcon: Icon(
                                Icons.lock,
                                color: AppColors.primary,
                              ),
                              hintText: '*********************',
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  _togglevisibility();
                                },
                                child: Icon(
                                  _showPassword ? Icons.visibility : Icons
                                      .visibility_off, color: AppColors.primary,),
                              ),
                            ),
                            validator: (value) {
                              if(value?.isEmpty ?? true) {
                                return 'Please enter your password';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),

                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value : true,
                                onChanged: (value) { },
                              ),
                              Text("REMEMBER ME",
                              style: TextStyle(
                                color: AppColors.primary,
                              ),),
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ResetPasswordScreen(), // replace LoginPage with your actual login page widget
                                ),
                              );
                            },
                            child: Text(
                              "Forgot password ?",
                              style: TextStyle(
                                color: AppColors.primary,
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
                            EdgeInsets.symmetric(horizontal: 90, vertical: 14),
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
                            AppColors.accent,
                          ),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100.0),
                            ),
                          ),
                          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                            EdgeInsets.symmetric(horizontal: 70, vertical: 14),
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
