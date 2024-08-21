import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/models/places.dart';

import '../../wedgets/categores/buttom_sheet.dart';
import '../../wedgets/categores/place_card.dart';

class PlayesesTypes extends StatefulWidget {
  final String text;

  const PlayesesTypes({super.key, required this.text});

  @override
  State<PlayesesTypes> createState() => _PlayesesTypesState();
}

class _PlayesesTypesState extends State<PlayesesTypes> {
  @override
  void initState() {
    playplace();
    super.initState();
  }

  TextEditingController title = TextEditingController();
  late final List<Myplace> p;
  TextEditingController subtitle = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_box_outlined),
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return ButtomShett(
                  title: title,
                  subtitle: subtitle,
                  text: widget.text,
                );
              });
        },
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/background.jpg'), fit: BoxFit.cover)),
        child: ListView.separated(
            itemBuilder: (context, index) {
              return PlaceCade(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${data[index]['title']}'),
                    Container(
                        padding: EdgeInsets.all(8),
                        height: MediaQuery.of(context).size.height * .2,
                        //   width: MediaQuery.of(context).size.width*.8,
                        child: Image.asset(
                          'images/background.jpg',
                          fit: BoxFit.fitHeight,
                        )),
                    Text('${data[index]['subtitle']}')
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 20,
              );
            },
            itemCount: data.length),
      ),
    );
  }

  List<QueryDocumentSnapshot> data = [];
  playplace() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection(widget.text).get();
    data.addAll(querySnapshot.docs);

    print('lllll');
    setState(() {});
  }
}
