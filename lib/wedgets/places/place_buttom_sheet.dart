
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../screnes/catigores/my_home_page.dart';



class PlaceButtomSheet extends StatefulWidget {
  final TextEditingController title;
  final String text;

  const PlaceButtomSheet(
      {super.key,
        required this.title, required this.text
       });

  @override
  State<PlaceButtomSheet> createState() => _PlaceButtomSheetState();
}

class _PlaceButtomSheetState extends State<PlaceButtomSheet> {
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

            SizedBox(
              height: 10,
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
          .collection('catigories')
          .add({'title': widget.title.text});
      print('kkkk');
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return  Navigator();
      },));
    } catch (e) {
      print(e);
    }
  }
}
