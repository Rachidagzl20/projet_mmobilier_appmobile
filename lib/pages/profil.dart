import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:projet_mmobilier_appmobile/utils/app_color.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'acceuil.dart';

class Profil extends StatefulWidget {


  @override
  _ProfilState createState() => _ProfilState();
}


class _ProfilState extends State<Profil> {

  //fetch data of current user in his profil
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nomCompletController = TextEditingController();
  final TextEditingController _adressController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _CINcontroller = TextEditingController();

  late String? clientName;

  @override
  void initState() {
    super.initState();
    // Fetch user data on screen initialization
    _getEmailFromSharedPreferences();


  }
  // Retrieve email from SharedPreferences
  Future<void> _getEmailFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String storedEmail = prefs.getString('email') ?? '';
    clientName = prefs.getString('nomComplet') ?? '';
    String storedadress = prefs.getString('adresse') ?? '';
    String storedCIN= prefs.getString('CIN') ?? '';
    String storedphone = prefs.getString('telephone') ?? '';


    setState(() {
      _emailController.text = storedEmail;
      _nomCompletController.text=clientName.toString();
      _adressController.text=storedadress;
      _phoneController.text=storedphone;
      _CINcontroller.text=storedCIN;

    });
  }
  // update  Data client
  Future<void> _updateUserData() async {
    // Get the updated values from the form fields
    String updatedNomComplet = _nomCompletController.text;
    String updatedAdresse = _adressController.text;
    String updatedEmail = _emailController.text;
    String updateCIN=_CINcontroller.text;
    String updatedphone=_phoneController.text;
    // ... Get other updated values

    // Update the user data in the database
    try {
      // Prepare the request body as per your API requirements
      var requestBody = {
        'nomComplet': updatedNomComplet,
        'adresse': updatedAdresse,
        'email': updatedEmail,
        'telephone': updatedphone,
        'CIN': updateCIN,
        // ... Add other fields telephone ,password
      };

      // Make the HTTP PUT request to update the user data
      var response = await http.put(
        Uri.parse('http://localhost:3000/client/api/updClient'),
        headers: {
          'Content-Type': 'application/json',
          // Add any other required headers
        },
        body: jsonEncode(requestBody),
      );

      if (response.statusCode == 200) {
        print("update Data");
      } else {
        print("Error updating user data");
      }
    } catch (e) {
      // Exception occurred during the request
      // Handle the exception and display an error message or perform any other error handling
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile',
        style: TextStyle(
          fontSize: 25.0,

          fontWeight: FontWeight.bold,
        ),),
        backgroundColor: AppColors.primary,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop(true);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              //TODO: Implement logout functionality
            },
          ),
        ],

      ),
      body: Container(

        child: SingleChildScrollView(
          reverse: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Stack(
                alignment: Alignment.bottomRight,
                children: [

                  const CircleAvatar(
                    radius: 60,
                    backgroundColor: AppColors.primarygreen,
                    child: CircleAvatar(
                      radius: 57,
                      backgroundImage: AssetImage('assets/profil_img.jpg'),
                    ),
                  ),
                  Positioned(
                    bottom: 2,
                    right: 2,
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 2,
                          color: Colors.white,
                        ),
                        color: AppColors.primarygreen,

                      ),
                      child: IconButton(
                        icon: const Icon(Icons.edit,
                        color: Colors.white,),
                        onPressed: () {
                          // Add your edit profile picture logic here
                        },

                      ),
                    ),
                  ),
                ],
              ),

              Text(
                '$clientName',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 35),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 200.0),
                      child: Text(
                        "Nom Complet",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,

                        ),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    TextFormField(
                      cursorColor: AppColors.primary,
                      cursorHeight: 23,
                      controller: _nomCompletController,
                      decoration: InputDecoration(


                        prefixIcon: const Icon(Icons.person,
                        color: AppColors.primary,),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: const BorderSide(width: 1, color:AppColors.primary ),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(width: 1, color:AppColors.accent )
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Padding(
                      padding: EdgeInsets.only(right: 260.0),
                      child: Text(
                        "Email",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,

                        ),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    TextFormField(
                      controller: _emailController,
                      cursorColor: AppColors.primary,
                      cursorHeight: 23,

                      decoration: InputDecoration(

                        prefixIcon: const Icon(Icons.email,
                            color: AppColors.primary),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: const BorderSide(width: 1, color:AppColors.primary ),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(width: 1, color:AppColors.accent )
                          ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Padding(
                      padding: EdgeInsets.only(right: 180.0),
                      child: Text(
                        "Numéro de téléphone",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,

                        ),
                      ),
                    ),
                    const SizedBox(height: 10),

                    TextFormField(
                      cursorColor: AppColors.primary,
                      cursorHeight: 23,
                      controller: _phoneController,

                      decoration: InputDecoration(

                        prefixIcon: const Icon(Icons.phone,
                            color: AppColors.primary),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: const BorderSide(width: 1, color:AppColors.primary ),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(width: 1, color:AppColors.accent )
                          ),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    const Padding(
                      padding: EdgeInsets.only(right: 260.0),
                      child: Text(
                        "CIN",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,

                        ),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    TextFormField(
                      cursorColor: AppColors.primary,
                      cursorHeight: 23,
                        controller:_CINcontroller,

                      decoration: InputDecoration(

                        prefixIcon: const Icon(Icons.date_range,
                            color: AppColors.primary),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: const BorderSide(width: 1, color:AppColors.primary ),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(width: 1, color:AppColors.accent )
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Padding(
                      padding: EdgeInsets.only(right: 260.0),
                      child: Text(
                        "Adresse",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,

                        ),
                      ),
                    ),
                    const SizedBox(height: 10,),

                    TextFormField(
                      cursorColor: AppColors.primary,
                      cursorHeight: 23,
                      controller: _adressController,

                      decoration: InputDecoration(

                        prefixIcon: const Icon(Icons.location_on,
                        color: AppColors.primary,),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: const BorderSide(width: 1, color:AppColors.primary ),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(width: 1, color:AppColors.accent )
                          ),),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 50,
                            width: 153,
                            child: ElevatedButton(
                              onPressed: () {
                                //TODO: Implement cancel functionality
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primary,

                                shape: RoundedRectangleBorder(

                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                              child: const Text('Annuler',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),),
                            ),
                          ),
                          const SizedBox(width: 10),
                          SizedBox(
                            height: 50,
                            width: 140,
                            child: ElevatedButton(
                              onPressed: () {
                                _updateUserData;

                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('success'),
                                      content: Text('update successful'),
                                      actions: <Widget>[
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text('OK'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                                //TODO: Implement save functionality
                              },
                              style: ElevatedButton.styleFrom(
                                primary: AppColors.primary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                              child: const Text('Sauvegarder',
                                  style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
