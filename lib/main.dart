import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/screnes/catigores/splash_view.dart';

import 'constes/colors.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(titleTextStyle: TextStyle(fontFamily: 'caveat')),
        fontFamily: 'caveat',
        colorScheme: ColorScheme.fromSeed(seedColor: kmaincolor),

        useMaterial3: true,
      ),

      home: const SplashView(),
    );
  }
}
