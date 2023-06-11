import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:projet_mmobilier_appmobile/utils/app_color.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../appBarpage.dart';
import '/pages/project_details.dart';
import 'package:projet_mmobilier_appmobile/models/project.dart';
import 'package:http/http.dart' as http;

class ProjectScreen extends StatefulWidget {
  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  late String? userId = '';
  late List<Map<String, dynamic>> projects = [];

  @override
  void initState() {
    super.initState();
    // Fetch user data on screen initialization
    _getClientDataFromSharedPreferences();

  }

  Future<void> _getClientDataFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = prefs.getString('userID') ?? '';
    fetchProjects();
  }

  Future<void> fetchProjects() async {
    try {
      final response = await http.get(Uri.parse('http://192.168.137.1:3000/project/listproject/$userId'));
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        setState(() {
          projects = data.map((project) {
            return {
              'title': project['nomProjet'],
              'logo': 'http://192.168.137.1:3000/image/${project['image']}',
              'type': project['type'],
              'etats_de_projet': project['etat'],
              'number_projet': project['project_number'],
              'taux_de_paiement': 10,
            };
          }).toList();
        });
      } else {
        print('Failed to fetch projects: ${response.statusCode}');
      }
    } catch (error) {
      print('Error fetching projects: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'VOUS ETES IMPLIQUE \nDANS CES PROJETS',
              style: TextStyle(
                fontSize: 23.0,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: projects.length,
              itemBuilder: (BuildContext context, int index) {
                final project = projects[index];
                return GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProDetailspage(item: project, image: project['logo'] ),
                            ),
                          );
                        },

                        leading: AspectRatio(
                          aspectRatio: 1,
                          child: Padding(
                            padding: EdgeInsets.zero,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                              child: Image.network(
                                project['logo']
                              ),
                            ),
                          ),
                        ),
                        title: Text(
                          project['title'],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 4.0),
                                    Stack(
                                      children: [
                                        Container(
                                          width: 40,
                                          height: 40,
                                          child: CircularProgressIndicator(
                                            value: project['etats_de_projet'] != null ? project['etats_de_projet'] / 100 : 0,
                                            backgroundColor: Colors.grey,
                                            strokeWidth: 6.0,
                                            valueColor: const AlwaysStoppedAnimation<Color>(
                                              AppColors.primary,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 8.0),
                                          child: Center(
                                            child: Text(
                                              '${project['etats_de_projet']}%',
                                              style: const TextStyle(
                                                fontSize: 10.0,
                                                fontWeight: FontWeight.bold,
                                                color: AppColors.primary,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 7.0),
                                    const Text(
                                      'ETATS DE PROJET',
                                      style: TextStyle(
                                        fontSize: 8.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 4.0),
                                    Stack(
                                      children: [
                                        Container(
                                          width: 40,
                                          height: 40,
                                          child: CircularProgressIndicator(
                                            value: project['taux_de_paiement'] / 100,
                                            backgroundColor: Colors.grey,
                                            strokeWidth: 6.0,
                                            valueColor: const AlwaysStoppedAnimation<Color>(
                                              Colors.red,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 8.0),
                                          child: Center(
                                            child: Text(
                                              '${project['taux_de_paiement']}%',
                                              style: const TextStyle(
                                                fontSize: 10.0,
                                                fontWeight: FontWeight.bold,
                                                color: AppColors.primary,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 7.0),
                                    const Text(
                                      'TAUX DE PAIEMENT',
                                      style: TextStyle(
                                        fontSize: 8.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        trailing: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  project['type'],
                                  style: const TextStyle(
                                    fontSize: 7.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(
                                  height: 9.0,
                                ),
                                Text(
                                  project['number_projet'].toString(),
                                  style: const TextStyle(
                                    fontSize: 10.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
