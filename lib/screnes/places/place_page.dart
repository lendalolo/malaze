import 'package:flutter/material.dart';

import '../../wedgets/places/post_app_bar.dart';
import '../../wedgets/places/post_buttom_bar.dart';

class PlacePage extends StatelessWidget {
  const PlacePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(''), fit: BoxFit.cover, opacity: 0.7),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(90), child: PostAppBar(),
        ),
        bottomNavigationBar: PostButtomBar(),
      ),
    );
  }
}
