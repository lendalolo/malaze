import 'package:flutter/material.dart';

import '../../models/places.dart';
class PlaceCade extends StatelessWidget {
  final Widget child;
  const PlaceCade({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
     margin: EdgeInsets.symmetric(horizontal: 20),
      width:MediaQuery.of(context).size.width,

      // height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.grey,
              offset: Offset(4, 4),
              blurRadius: 4,
              spreadRadius: 1),
          BoxShadow(
              color: Colors.white,
              offset: Offset(-4, -4),
              blurRadius: 4,
              spreadRadius: 1),
        ],
      ),
      child: child,
    );
  }
}
