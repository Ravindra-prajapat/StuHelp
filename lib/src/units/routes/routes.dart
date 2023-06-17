// import 'package:application1/src/features/authentication/screens/login/login_screen.dart';
// import 'package:application1/src/features/authentication/screens/signup/signup_screen.dart';
// import 'package:application1/src/features/authentication/screens/splash_screen/splash_screen.dart';
// import 'package:application1/src/features/authentication/screens/welcome/welcome_screen.dart';
// import 'package:application1/src/features/core/screens/dashboard/dashboard.dart';
// import 'package:application1/src/units/routes/routes_name.dart';
// import 'package:flutter/material.dart';



// class Routes {

//   static Route<dynamic> generateRoute(RouteSettings settings) {
//     final arguments = settings.arguments;
//     switch (settings.name) {
//       case RouteName.splashScreen:

//         return MaterialPageRoute(builder: (_) => const SplashScreen());

//         case RouteName.loginView:

//         return MaterialPageRoute(builder: (_) => const LoginScreen());

//          case RouteName.signUpScreen:

//         return MaterialPageRoute(builder: (_) => const SignUpScreen());

//         case RouteName.dashboardScreen:

//         return MaterialPageRoute(builder: (_) => const Dashboard());

//         case RouteName.welcomeScreen:

//         return MaterialPageRoute(builder: (_) => const WelcomeScreen());


//       default:
//         return MaterialPageRoute(builder: (_) {
//           return Scaffold(
//             body: Center(
//               child: Text('No route defined for ${settings.name}'),
//             ),
//           );
//         });
//     }
//   }
// }