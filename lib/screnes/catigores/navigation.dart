import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/constes/colors.dart';


import 'my_home_page.dart';
class NaviGation extends StatefulWidget {
      NaviGation({super.key});

  @override
  State<NaviGation> createState() => _NaviGationState();
}

class _NaviGationState extends State<NaviGation> {
  int index=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        onTap: (value) {
          setState(() {
            index=value;
          });
        },
        backgroundColor: Colors.transparent,
          animationDuration: Duration(milliseconds: 500),
          buttonBackgroundColor:kmaincolor ,
          color: kmaincolor,
          items:<Widget>[
            Icon(Icons.home,size: 20,color: Colors.white,),
            Icon(Icons.local_library_rounded,size: 20,color: Colors.white,),
            Icon(Icons.add_box,size: 20,color: Colors.white,)
          ] ),
      body: pages[index],
    );
  }

  List pages =[MyHomePage(),MyHomePage(),MyHomePage(),];
}
