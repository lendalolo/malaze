import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/constes/colors.dart';
import 'package:untitled2/screnes/catigores/places_types.dart';
import 'package:untitled2/wedgets/home_page/my_card.dart';

import '../../wedgets/places/place_buttom_sheet.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController name = TextEditingController();
  @override
  void initState() {
    playplace1();
    super.initState();
  }

  bool isloading = true;
  List<QueryDocumentSnapshot> data = [];
  playplace1() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('catigories').get();
    data.addAll(querySnapshot.docs);
    print('lllll');
    isloading = false;
    setState(() {});
  }

  @override
  void dispose() {
    name.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return PlaceButtomSheet(
                      title: name,
                      text: 'catigory',
                    );
                  });
            },
            child: Icon(Icons.add)),
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(gradient: myGradient),
          ),
          title: Center(
              child: Text(
            'places',
            style: TextStyle(fontFamily: 'caveat'),
          )),
          titleTextStyle: TextStyle(
              color: ktextcolor, fontWeight: FontWeight.w700, fontSize: 30),
        ),
        body: isloading == true
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/background.jpg'),
                        fit: BoxFit.cover)),
                child: GridView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return MyCard(
                      name: data[index]['title'],
                      ontap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  PlayesesTypes(text: data[index]['title']),
                            ));
                      },
                      onlongPress: () {
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.warning,
                          animType: AnimType.rightSlide,
                          title: 'Error',
                          desc: 'shows what you want to do',
                          btnOkOnPress: () async {
                            await FirebaseFirestore.instance
                                .collection('catigories')
                                .doc(data[index].id)
                                .delete();
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(
                              builder: (context) {
                                return MyHomePage();
                              },
                            ));
                          },
                          btnCancelOnPress: () {},
                        ).show();
                      },
                    );
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                ),
              ),
      ),
    );
  }
}
