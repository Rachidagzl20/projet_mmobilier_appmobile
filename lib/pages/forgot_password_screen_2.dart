import 'package:flutter/material.dart';
import 'package:projet_mmobilier_appmobile/appBarpage.dart';
import '../utils/app_color.dart';
import 'forgot_password_screen_3.dart';

class EnterCodeScreen extends StatefulWidget {
  const EnterCodeScreen({Key? key}) : super(key: key);

  @override
  State<EnterCodeScreen> createState() => _EnterCodeScreenState();
}

class _EnterCodeScreenState extends State<EnterCodeScreen> {
  final TextEditingController _code1Controller = TextEditingController();
  final TextEditingController _code2Controller = TextEditingController();
  final TextEditingController _code3Controller = TextEditingController();
  final TextEditingController _code4Controller = TextEditingController();

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 1.0),
                child: Image.asset(
                  'assets/forgot_img.png',
                  width: 150,
                  height: 150,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                'Réinitialiser le mot de passe',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Veuillez entrer le code de vérification que nous avons envoyé à votre adresse e-mail',
                style: TextStyle(
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 36,
              ),
              Row(

                children: [
                  SizedBox(width: 40,),
                  _buildCodeInput(_code1Controller),
                  SizedBox(width: 15,),
                  _buildCodeInput(_code2Controller),
                  SizedBox(width: 15,),
                  _buildCodeInput(_code3Controller),
                  SizedBox(width: 15,),
                  _buildCodeInput(_code4Controller),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              ElevatedButton(
                onPressed:(){ Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => forgot_Password_change_Screen()),
                );
                },
                child: Text('Valider'),
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
                    EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed: () {
                  // handle resend code here
                },
                child: Text('Vous n\'avez pas reçu de code ? Renvoyer'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCodeInput(TextEditingController controller) {
    return SizedBox(
      width: 60,
      height: 60,
      child: TextField(
        controller: controller,
        maxLength: 1,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 10.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          counterText: '',
        ),
      ),
    );
  }
}
