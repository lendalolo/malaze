import 'package:flutter/material.dart';
import 'package:untitled2/constes/colors.dart';


class MyCard extends StatelessWidget {
 final VoidCallback ontap;
 final VoidCallback onlongPress;
  final String name;
  const MyCard( {super.key, required this.name, required this.ontap, required this.onlongPress});



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: onlongPress,
      onTap: ontap,
      child: Container(
        // height: 200,
        // width: 200,
       padding: EdgeInsets.all(3),
       margin: EdgeInsets.all(15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient:myGradient,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
                color: Colors.grey,
                offset: Offset(4, 4),
                blurRadius: 15,
                spreadRadius: 1),
            BoxShadow(
                color: Colors.white,
                offset: Offset(-4, -4),
                blurRadius: 15,
                spreadRadius: 1),
          ],
        ),
        child: Text(
          name,
          style: TextStyle(
              fontWeight: FontWeight.w700, fontSize: 30, color: ktextcolor),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
