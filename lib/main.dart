import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:application1/firebase_options.dart';
import 'package:application1/src/features/authentication/screens/splash_screen/splash_screen.dart';
import 'package:application1/src/repository/authentication_repository/authentication_repository.dart';
import 'package:application1/src/units/theme/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  Firebase.initializeApp(options:DefaultFirebaseOptions.currentPlatform).then((value)=>Get.put(AuthenticationRepository()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 500),
      home: const SplashScreen(),
    );
  }
}
