import 'dart:convert';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:projet_mmobilier_appmobile/appBarpage.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:projet_mmobilier_appmobile/models/publication.dart';

import 'package:http/http.dart' as http;

import '../models/user.dart';
class MyAcceuil extends StatefulWidget {
  const MyAcceuil({Key? key}) : super(key: key);

  @override
  State<MyAcceuil> createState() => _MyAcceuilState();
}

class _MyAcceuilState extends State<MyAcceuil> {
  late List<Publication> publications = [];


  get username => null;


  @override
  void initState() {
    super.initState();
    fetchPublications();

  }
  Future<void> fetchPublications() async {
    try {
      final response = await http.get(Uri.parse('http://192.168.137.1:3000/publication/'));
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        setState(() {

          publications = data.map((publication) {
            return Publication(

              date: DateTime.parse(publication['date_publication']),
              userID: publication['user'],
              imageID: publication['images'],

              description: publication['description'],
            );

          }).toList();
        });
        fetchAdditionalData();

      } else {
        print('Failed to fetch publications: ${response.statusCode}');
      }
    } catch (error) {
      print('Error fetching publications: $error');
    }
  }
  Future<void> fetchAdditionalData() async {
    for (var publication in publications) {
      final response = await http.get(Uri.parse('http://192.168.137.1:3000/user/${publication.userID}'));
      if (response.statusCode == 200) {
        final userData = jsonDecode(response.body);
        final username = userData['username'];
        final imageProfile = userData['avatar'];

        setState(() {
          publication.username = username;
          publication.imageProfile = imageProfile;
        });
      } else {
        print('Failed to fetch user data: ${response.statusCode}');
      }
    }
  }

  Widget buildImageWidget(String imageUrl) {
    return Image.network(imageUrl);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: ListView.builder(
        itemCount: publications.length,
        itemBuilder: (context, index) {
          final publication = publications[index];
          final formattedDate =formatDate(publication.date , [yyyy, '-', mm, '-', dd]) ;// Format the DateTime object
          return Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  offset: const Offset(0, 0.5), // changes position of shadow
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 4,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage('http://192.168.137.1:3000/image/${publication.imageProfile}'),
                            radius: 30,
                          ),
                          const SizedBox(width: 16),
                          Expanded(

                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  publication.username,
                                  style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),
                                ),
                                const SizedBox(height: 11.0,),
                                Text(formattedDate),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          children:  [

                            Expanded(
                              child: Text(publication.description,
                                style: TextStyle(fontSize: 11),
                                softWrap: false,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network('http://192.168.137.1:3000/image/${publication.imageID}'),
                      ),

                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
