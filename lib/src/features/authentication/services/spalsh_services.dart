// import 'dart:async';

// import 'package:application1/src/features/authentication/services/session_mamager.dart';
// import 'package:application1/src/features/core/screens/dashboard/dashboard.dart';
// import 'package:application1/src/units/routes/routes_name.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class SplashServices {
//   void isLogin(BuildContext context) {
//     FirebaseAuth auth = FirebaseAuth.instance;

//     final user = auth.currentUser;

//     if (user != null) {
//       SessionController().userId = user.uid.toString();
//       Timer(
//           Duration(seconds: 3),
//           () => Navigator.push(
//                 context,
//                 MaterialPageRoute<void>(
//                   builder: (BuildContext context) => const Dashboard(),
//                 ),
//               ));
//     } else {
//       Timer(Duration(seconds: 3),
//           () => Navigator.pushNamed(context, RouteName.loginView));
//     }
//   }
// }
