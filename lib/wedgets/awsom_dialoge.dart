// import 'package:awesome_dialog/awesome_dialog.dart';
// import 'package:flutter/material.dart';
// class AwsomDialoge extends StatelessWidget {
//   const AwsomDialoge({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const AwesomeDialog(context: context,
//       dialogType: DialogType.warning,
//       animType:  AnimType.rightSlide,
//       title: 'Error',
//       desc:'shows what you want to do' ,
//       btnOkOnPress: () async{
//         await FirebaseFirestore.instance.collection('catigories').doc(data[index].id).delete();
//         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
//           return  MyHomePage();
//         },));
//       },
//       btnCancelOnPress: () {
//
//       },
//     ).show();;
//   }
// }
