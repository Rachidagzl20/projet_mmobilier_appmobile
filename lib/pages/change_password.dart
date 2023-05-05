import 'package:flutter/material.dart';
import 'package:projet_mmobilier_appmobile/utils/app_color.dart';

class PasswordChangeScreen extends StatefulWidget {
  @override
  _PasswordChangeScreenState createState() => _PasswordChangeScreenState();
}

class _PasswordChangeScreenState extends State<PasswordChangeScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _currentPassword;
  late String _newPassword;
  late String _confirmNewPassword;
  bool _showPassword = false;
  void _togglevisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Password'),
        centerTitle: true,
        backgroundColor: AppColors.primary,
      ),
      body: SingleChildScrollView(

        reverse: true,
        child: Padding(
          padding: EdgeInsets.all(16.0),

          child: Form(
            key: _formKey,

            child: Padding(
              padding: const EdgeInsets.only(top:158),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: Text("CHANGEZ VOTRE MOT DE PASSE ICI ",
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 21
                    ),),
                  ),
                   SizedBox(height: 10.0,),
                   TextFormField(
                    obscureText: !_showPassword,
                    cursorColor: Colors.blueAccent,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      hintText: "Password",

                      suffixIcon: GestureDetector(
                        onTap: () {
                          _togglevisibility();
                        },
                        child: Icon(
                          _showPassword ? Icons.visibility : Icons
                              .visibility_off, color: AppColors.primary,),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    obscureText: !_showPassword,
                    cursorColor: Colors.blueAccent,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      hintText: "New Password",

                      suffixIcon: GestureDetector(
                        onTap: () {
                          _togglevisibility();
                        },
                        child: Icon(
                          _showPassword ? Icons.visibility : Icons
                              .visibility_off, color: AppColors.primary,),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    obscureText: !_showPassword,
                    cursorColor: Colors.blueAccent,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      hintText: "Confirm New Password",

                      suffixIcon: GestureDetector(
                        onTap: () {
                          _togglevisibility();
                        },
                        child: Icon(
                          _showPassword ? Icons.visibility : Icons
                              .visibility_off, color: AppColors.primary,),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Row(
                  children: [
                    ElevatedButton(
                      child: Text('Annuler Password'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          AppColors.primary,
                        ),
                      ),
                      onPressed: () {},
                    ),
                    SizedBox(width: 50.0,),
                    ElevatedButton(
                      child: Text('Change Password'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          AppColors.primary,
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ],

                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


