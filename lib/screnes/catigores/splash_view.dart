
import 'package:flutter/material.dart';
import 'package:untitled2/constes/colors.dart';

import 'my_home_page.dart';
import 'navigation.dart';


class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation? falling;
  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));
    falling = Tween<double>(begin: .2, end: 1).animate(animationController!)
      ..addListener(() {
        setState(() {
          if (animationController!.isCompleted) {
            animationController?.repeat(reverse: true);
          }
        });
      });

    animationController!.forward();
    _navigation();
  }
  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Center(
              child: Opacity(
                opacity: falling?.value,
                child: Text('Malaz',
                    style: TextStyle(
                        fontSize: 50,
                        color: kmaincolor,
                        fontWeight: FontWeight.w700)),
              )),
          // Image.asset('images/a.jpg'),
        ]),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/splash.png"), fit: BoxFit.cover)),
      ),
    );
  }

  _navigation() async {
    await Future.delayed(Duration(seconds: 3), () {});
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => NaviGation(),
        ));
  }
}
