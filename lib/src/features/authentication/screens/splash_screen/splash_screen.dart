import 'package:application1/src/constants/image_strings.dart';
import 'package:application1/src/features/authentication/services/spalsh_services.dart';
import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';
import '../welcome/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool animate = false;

  //SplashServices services = SplashServices();

  @override
  void initState() {
    super.initState();
    startAnimation();
    //services.isLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    var mediaQuery = MediaQuery.of(context);
    var brighgtness = mediaQuery.platformBrightness;

    final isDarkMode = brighgtness == Brightness.dark;
    return SafeArea(
      child: Scaffold(
          backgroundColor: isDarkMode ? tSecondaryColor : tPrimaryColor,
          body: SafeArea(
            child: Stack(
              children: [
                AnimatedOpacity(
                  opacity: animate ? 1 : 0,
                  duration: const Duration(milliseconds: 1600),
                  child: Image(
                    image: const AssetImage(tSplashTopIcon),
                    height: deviceSize.height,
                  ),
                ),
              ],
            ),
          )),
    );
  }

  Future startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() => animate = true);
    await Future.delayed(const Duration(milliseconds: 1600));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const WelcomeScreen(),
      ),
    );
  }
}
