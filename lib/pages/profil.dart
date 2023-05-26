import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:projet_mmobilier_appmobile/utils/app_color.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'acceuil.dart';

class Profil extends StatefulWidget {
  const Profil({super.key});



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

  late String? clientName ="";
  late String? userId ="" ;

  @override
  void initState() {
    super.initState();
    // Fetch user data on screen initialization
    _getClientDataFromSharedPreferences();


  }

  Future<void> _fetchClientData() async {
    try {
      // Make the HTTP GET request to fetch the user data
      var response = await http.get(
        Uri.parse('http://localhost:3000/client/$userId'),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        var updatedEmail = responseData['email'];
        clientName= responseData['nomComplet'];
        var updatedAdresse = responseData['adresse'];
        var updatedPhone = responseData['telephone'];
        var updateCIN = responseData['CIN'];

        setState(() {
          _emailController.text = updatedEmail;
          _nomCompletController.text = clientName.toString();
          _adressController.text = updatedAdresse;
          _phoneController.text = updatedPhone;
          _CINcontroller.text = updateCIN;
        });
      } else {
        print("Error fetching user data");
      }
    } catch (e) {
      print(e);
    }
  }


  // Retrieve email from SharedPreferences
  Future<void> _getClientDataFromSharedPreferences()  async {
    SharedPreferences prefs =  await SharedPreferences.getInstance();
    clientName = prefs.getString('nomComplet') ?? '';
    userId = prefs.getString('userID')?? '';
    _fetchClientData();

  }
  // update  Data client


  Future<void> _updateUserData(String updatedNomComplet,String updatedAdresse,String updatedEmail,String updateCIN,String updatedPhone ) async {
    // Get the updated values from the form fields
    updatedNomComplet = _nomCompletController.text;
    updatedAdresse = _adressController.text;
    updatedEmail = _emailController.text;
    updateCIN = _CINcontroller.text;
    updatedPhone = _phoneController.text;

    try {
      // Prepare the request body as per your API requirements
      var requestBody = {
        'nomComplet': updatedNomComplet,
        'adresse': updatedAdresse,
        'email': updatedEmail,
        'telephone': updatedPhone,
        'CIN': updateCIN,
        // ... Add other fields telephone, password
      };

      // Make the HTTP PUT request to update the user data
      var response = await http.put(
        Uri.parse('http://localhost:3000/client/updClient/$userId'),
        headers: {
          'Content-Type': 'application/json',
          // Add any other required headers
        },
        body: jsonEncode(requestBody),
      );

      if (response.statusCode == 200) {
        print("update successful ");

        // Fetch the updated user data after a successful update
        await _fetchClientData();
      } else {
        print("Error updating user data");
      }
    } catch (e) {
     print(e);
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

                    const SizedBox(height: 20,),
                    TextFormField(
                      cursorColor: AppColors.primary,
                      cursorHeight: 23,
                      controller: _nomCompletController,
                      decoration: InputDecoration(

                        labelText: "Nom Complet",

                        labelStyle: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,// Add your desired color here
                        ),
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

                    const SizedBox(height: 20,),
                    TextFormField(

                      controller: _emailController,
                      cursorColor: AppColors.primary,
                      cursorHeight: 23,

                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.email,
                            color: AppColors.primary),
                        labelText: "Email",

                        labelStyle: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,// Add your desired color here
                        ),
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

                    const SizedBox(height: 20),

                    TextFormField(
                      cursorColor: AppColors.primary,
                      cursorHeight: 23,
                      controller: _phoneController,

                      decoration: InputDecoration(
                        labelText: "Numéro de téléphone",

                        labelStyle: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,// Add your desired color here
                        ),
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

                    const SizedBox(height: 20,),
                    TextFormField(
                      cursorColor: AppColors.primary,
                      cursorHeight: 23,
                        controller:_CINcontroller,

                      decoration: InputDecoration(
                        labelText: "CIN",

                        labelStyle: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,// Add your desired color here
                        ),
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

                    const SizedBox(height: 20,),

                    TextFormField(
                      cursorColor: AppColors.primary,
                      cursorHeight: 23,
                      controller: _adressController,

                      decoration: InputDecoration(
                        labelText: "Adresse",

                        labelStyle: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,// Add your desired color here
                        ),
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

                        Center(
                          child: SizedBox(
                          height: 50,
                          width: 153,
                          child: ElevatedButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text("Confirmation"),
                                    content: const Text(
                                      "Voulez-vous vraiment enregistrer les modifications ?",
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                          _fetchClientData();
                                        },
                                        child: const Text("Non"),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          _updateUserData(
                                            _nomCompletController.text,
                                            _adressController.text,
                                            _emailController.text,
                                            _CINcontroller.text,
                                            _phoneController.text,
                                          );
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text("Oui"),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                            child: const Text(
                              'Sauvegarder',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
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
