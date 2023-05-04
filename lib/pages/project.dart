import 'package:flutter/material.dart';
import 'package:projet_mmobilier_appmobile/utils/app_color.dart';
import '../appBarpage.dart';
import '/pages/project_details.dart';

class Project extends StatefulWidget {
  const Project({Key? key}) : super(key: key);

  @override
  State<Project> createState() => _ProjectState();
}

class _ProjectState extends State<Project> {
  final List<Map<String, dynamic>> projectList = [

  { 'id': 1,
    'image': 'assets/pub_1.png',
    'title': 'Project 1',
    'etats_de_projet': 85,
    'taux_de_paiement': 75
    , 'project_name':'VILLA'
    ,'project_number':24,},
    { 'id': 2,
    'image': 'assets/pub_2.png',
      'title': 'Project 2',
      'etats_de_projet': 95,
      'taux_de_paiement': 60,
      'project_name':'TERRAIN',
      'project_number':02, }
  ] ;// add more projects here  ];

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: MyAppBar(),
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
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
            itemCount: projectList.length,
            itemBuilder: (BuildContext context, int index) {
              final project = projectList[index];
              return GestureDetector(
                

                child: Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProDetailspage(item: projectList[index], id: projectList[index],),
                          ),
                        );
                      },
                      leading :AspectRatio(
                        aspectRatio: 1,
                        child: Padding(
                          padding: EdgeInsets.zero,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                            child: Image.asset(
                              project['image'],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),

                      title: Text(project['title'],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),),
                      subtitle: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  SizedBox(height: 4.0),
                                  Stack(

                                    children: [
                                      Container(

                                        width: 40,
                                        height: 40,
                                        child: CircularProgressIndicator(
                                          value: project['etats_de_projet'] / 100,
                                          backgroundColor: Colors.grey,
                                          strokeWidth: 6.0,
                                          valueColor: AlwaysStoppedAnimation<Color>(
                                            AppColors.primary, //<-- SEE HERE
                                          ),
                                        ),
                                      ),


                                      Center(
                                        child: Text(
                                          '${project['etats_de_projet']}%',
                                          style: TextStyle(
                                            fontSize: 10.0,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.primary,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 7.0),
                                  Text(
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
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [

                                  SizedBox(height: 4.0),
                                  Stack(
                                    children: [
                                      Container(
                                        width: 40,
                                        height: 40,
                                        child: CircularProgressIndicator(
                                          value: project['taux_de_paiement'] /
                                              100,
                                          backgroundColor: Colors.grey,
                                          strokeWidth: 6.0,
                                          valueColor: AlwaysStoppedAnimation<Color>(
                                            Colors.red, //<-- SEE HERE
                                          ),
                                        ),
                                      ),
                                      Center(
                                        child: Text(
                                          '${project['taux_de_paiement']}%',
                                          style: TextStyle(
                                            fontSize: 10.0,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.primary,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 7.0),
                                  Text(
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
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                project['project_name'],
                                style: TextStyle(
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 9.0,),

                              Text(
                                project['project_number'].toString(),
                                style: TextStyle(
                                  fontSize: 16.0,
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
}}