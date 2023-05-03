import 'package:flutter/material.dart';
import 'package:projet_mmobilier_appmobile/appBarpage.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class Publication {
  final String name;
  final String date;
  final String image;
  final String text;
  final String bottomImage;

  Publication({
    required this.name,
    required this.date,
    required this.image,
    required this.text,
    required this.bottomImage,
  });
}

class myacceuil extends StatefulWidget {
  const myacceuil({Key? key}) : super(key: key);

  @override
  State<myacceuil> createState() => _myacceuilState();
}

class _myacceuilState extends State<myacceuil> {
  final List<Publication> publications = [
    Publication(
      name: 'Farid Aammi',
      date: 'May 1st, 2023',
      image: 'assets/profile_1.png',
      text: "تعلن الشركة عن جمع عام يوم السبت الموافق 15 أبريل لمناقشة اشغال الشهر مارس أبريل لمناقشة اشغال الشهر مارس أبريل لمناقشة اشغال الشهر مارس أبريل لمناقشة اشغال الشهر مارس أبريل لمناقشة اشغال الشهر مارس أبريل لمناقشة اشغال ",
      bottomImage: 'assets/pub_1.png',
    ),
    Publication(
      name: 'SIHAM KINANI',
      date: 'April 28th, 2023',
      image: 'assets/profile_2.jpeg',
      text: "تعلن الشركة عن جمع عام يوم السبت الموافق 15 أبريل لمناقشة اشغال الشهر مارس ",

      bottomImage: 'assets/pub_2.png',
    ),
    Publication(
      name: 'JAMILA IMMO',
      date: 'April 25th, 2023',
      image: 'assets/profile_1.png',
      text: "تعلن الشركةعن جمع عام يوم السبت الموافق 15 أبريل لمناقشة اشغال الشهر مارس",
      bottomImage: 'assets/pub_1.png',
    ),
    // add more publications here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: ListView.builder(
        itemCount: publications.length,
        itemBuilder: (context, index) {
          final publication = publications[index];
          return Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  offset: Offset(0, 1), // changes position of shadow
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
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage(publication.image),
                            radius: 30,
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  publication.name,
                                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),
                                ),
                                SizedBox(height: 11.0,),
                                Text(publication.date),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          children:  [

                            Expanded(
                              child: Text(publication.text,
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
                      child: Image.asset(publication.bottomImage),
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
