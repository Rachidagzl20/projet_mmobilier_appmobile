

import 'package:flutter/material.dart';
import 'package:projet_mmobilier_appmobile/utils/app_color.dart';

import 'forgot_password_screen_2.dart';

class ResetPasswordScreen extends StatefulWidget {
  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _onResetPasswordPressed() {
    if (_emailController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter your email')),
      );
    } else {
      // Call your reset password API here and send a code to the user's email
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => EnterCodeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text('Reset Password'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top:1.0),
                  child: Image.asset(
                    'assets/img_1.png',
                    width: 150,
                    height: 150,
                  ),

                ),
                SizedBox(height: 40,),
                Text(
                  'Réinitialiser le mot de passe',
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20,),
                Text(
                  'Entrez l\'e-mail associé à votre compte et nous vous enverrons un e-mail avec le code de verification pour réinitialiser votre mot de passe.,',
                  style: TextStyle(
                    fontSize: 14,

                  ),

                  textAlign: TextAlign.justify,

                ),
                SizedBox(height: 36),
                Padding(
                  padding: const EdgeInsets.all(8.0),
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
                          Icons.email_outlined,
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
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed:(){ Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EnterCodeScreen()),
                  );
                    },
                  child: Text('Reset Password'),
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
                      EdgeInsets.symmetric(horizontal: 84, vertical: 12),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

