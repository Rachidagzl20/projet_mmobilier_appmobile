import 'package:flutter/material.dart';
import 'package:projet_mmobilier_appmobile/utils/app_color.dart';

import 'acceuil.dart';

class Profil extends StatefulWidget {
  @override
  _ProfilState createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile',
        style: TextStyle(
          fontSize: 25.0,

          fontWeight: FontWeight.bold,
        ),),
        backgroundColor: AppColors.primary,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop(true);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
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
              SizedBox(height: 20),
              Stack(
                alignment: Alignment.bottomRight,
                children: [

                  CircleAvatar(
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
                        icon: Icon(Icons.edit,
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
                'Hamid Hamidi',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 35),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 260.0),
                      child: Text(
                        "Prénom",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,

                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                      cursorColor: AppColors.primary,
                      cursorHeight: 23,

                      controller: _firstNameController,
                      decoration: InputDecoration(
                        hintText: "Saisir votre prenom",

                        prefixIcon: Icon(Icons.person,
                        color: AppColors.primary,),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: BorderSide(width: 1, color:AppColors.primary ),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(width: 1, color:AppColors.accent )
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(right: 260.0),
                      child: Text(
                        "Nom",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,

                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                      cursorColor: AppColors.primary,
                      cursorHeight: 23,

                      controller: _lastNameController,
                      decoration: InputDecoration(
                        hintText: "Saisir votre Nom",
                        prefixIcon: Icon(Icons.person,
                            color: AppColors.primary),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: BorderSide(width: 1, color:AppColors.primary ),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(width: 1, color:AppColors.accent )
                          ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(right: 260.0),
                      child: Text(
                        "Email",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,

                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                      cursorColor: AppColors.primary,
                      cursorHeight: 23,

                      controller: _emailController,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        prefixIcon: Icon(Icons.email,
                            color: AppColors.primary),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: BorderSide(width: 1, color:AppColors.primary ),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(width: 1, color:AppColors.accent )
                          ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(right: 180.0),
                      child: Text(
                        "Numéro de téléphone",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,

                        ),
                      ),
                    ),
                    SizedBox(height: 10),

                    TextFormField(
                      cursorColor: AppColors.primary,
                      cursorHeight: 23,

                      controller: _phoneNumberController,
                      decoration: InputDecoration(
                        hintText: 'Numéro de téléphone',
                        prefixIcon: Icon(Icons.phone,
                            color: AppColors.primary),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: BorderSide(width: 1, color:AppColors.primary ),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(width: 1, color:AppColors.accent )
                          ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.only(right: 260.0),
                      child: Text(
                        "Adresse",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,

                        ),
                      ),
                    ),
                    SizedBox(height: 10,),

                    TextFormField(
                      cursorColor: AppColors.primary,
                      cursorHeight: 23,

                      controller: _addressController,
                      decoration: InputDecoration(
                        hintText: 'Adresse',
                        prefixIcon: Icon(Icons.location_on,
                        color: AppColors.primary,),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: BorderSide(width: 1, color:AppColors.primary ),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(width: 1, color:AppColors.accent )
                          ),),
                    ),
                    SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 50,
                          width: 153,
                          child: ElevatedButton(
                            onPressed: () {
                              //TODO: Implement cancel functionality
                            },
                            child: Text('Annuler',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),),
                            style: ElevatedButton.styleFrom(
                              primary: AppColors.primary,

                              shape: RoundedRectangleBorder(

                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 50),
                        SizedBox(
                          height: 50,
                          width: 140,
                          child: ElevatedButton(
                            onPressed: () {
                              //TODO: Implement save functionality
                            },
                            child: Text('Sauvegarder',
                                style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            )),
                            style: ElevatedButton.styleFrom(
                              primary: AppColors.primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                          ),
                        ),
                      ],
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
