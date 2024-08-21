
import 'dart:io';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class ButtomShett extends StatefulWidget {
  final TextEditingController title;
  final TextEditingController subtitle;
  final String text;
  const ButtomShett(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.text});

  @override
  State<ButtomShett> createState() => _ButtomShettState();
}

class _ButtomShettState extends State<ButtomShett> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Add place',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
            ),
            TextFormField(
              controller: widget.title,
              decoration: InputDecoration(
                labelText: 'write the title',
              ),
            ),
            TextFormField(
              maxLines: 4,
              decoration: InputDecoration(
                labelText: 'write the description',
              ),
              controller: widget.subtitle,
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
            pickerfromGaallery();
              },
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Icon(Icons.add), Text('add picture')],
            )
            ),
            Center(
              child: IconButton(
                onPressed: () {
                  addplace();
                },
                icon: Icon(Icons.add),
                style: IconButton.styleFrom(
                  backgroundColor: Color(0xfff1c0fa),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  // CollectionReference initres(){
  addplace() async {
    try {
      await FirebaseFirestore.instance
          .collection('parks')
          .add({'title': widget.title.text, 'subtitle': widget.subtitle.text});
      print('kkkk');
    } catch (e) {
      print(e);
    }
  }
  late Uint8List image;
  late File? selectedImage;
  Future pickerfromGaallery() async {
    final returnImage =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() async {
      if (returnImage == null) return;
      selectedImage = File(returnImage.path);
      image = File(returnImage.path).readAsBytesSync();

    });
  }}
