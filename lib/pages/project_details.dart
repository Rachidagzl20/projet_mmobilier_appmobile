import 'package:flutter/material.dart';
import 'package:projet_mmobilier_appmobile/utils/app_color.dart';

import '../appBarpage.dart';

class ProDetailspage extends StatelessWidget {
  final Map<String, dynamic> item;

  ProDetailspage({Key? key, required this.item, required id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.logout_outlined)),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Align(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  item['image'],
                  width: 100,
                  height: 100,
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              item['title'],
              style: TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0),
            ),
            SizedBox(
              height: 15.0,
            ),
            Container(
              width: 120,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: AppColors.primarygreen,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 5,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  "${item['etats_de_projet'].toString()}%",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: 500,
                height: 500,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      blurRadius: 5,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text("HISTORIQUES ",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
