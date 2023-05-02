import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projet_mmobilier_appmobile/utils/app_color.dart';

class MyBottomSheet extends StatefulWidget {
  const MyBottomSheet({Key? key}) : super(key: key);

  @override
  _MyBottomSheetState createState() => _MyBottomSheetState();
}

class _MyBottomSheetState extends State<MyBottomSheet> {
  final _picker = ImagePicker();
  File? _image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      decoration: BoxDecoration(
        color: Color(0xFF100DB1),
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                'AJOUTER UN MONTANT',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 250.0),
              child: Text(
                "MONTANT",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            SizedBox(
              height: 50,
              width: 355,
              child: TextField(
                decoration: InputDecoration(
                  filled: true, // set the filled property to true
                  fillColor: Colors.white, // set the fill color to white

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                style: TextStyle(
                  color: Colors.white, // set the color to red
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.only(right: 269.0),
              child: Text(
                "MOTIF",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            SizedBox(
              height: 50,
              width: 355,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Motif',
                  filled: true, // set the filled property to true
                  fillColor: Colors.white, // set the fill color to white

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.only(right: 269.0),
              child: Text(
                "PROJET",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            SizedBox(
              height: 50,
              width: 355,
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  filled: true, // set the filled property to true
                  fillColor: Colors.white, // set the fill color to white

                  hintText: 'Select project',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                items: ['Project 1', 'Project 2', 'Project 3']
                    .map((project) => DropdownMenuItem(
                          value: project,
                          child: Text(project),
                        ))
                    .toList(),
                onChanged: (value) {},
              ),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.only(right: 188.0),
              child: Text(
                "LA PREUVE BANCAIRE",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            GestureDetector(
              onTap: () => selectImage(),
              child: Container(
                width: double.infinity,
                height: 100,
                padding: EdgeInsets.fromLTRB(10.0, 5, 10.0, 0.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Column(
                  children: [
                    Icon(
                      Icons.cloud_upload_outlined,
                      size: 42,
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      'Déposez des fichiers ou Parcourez',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      'Formats pris en charge : JPEG, PNG, , PDF, Word',
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.0),
            SizedBox(
              height: 40,
              width: 300,
              child: ElevatedButton(
                onPressed: () {},

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Valider',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                    ),
                    Icon(Icons.arrow_forward),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  primary: AppColors.primary,
                  // set the background color
                  side: BorderSide(color: Colors.white, width: 2),
                  // set the border color and width
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(30), // set the border radius
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future selectImage() async {
    final pickedFile = await _picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }
}
