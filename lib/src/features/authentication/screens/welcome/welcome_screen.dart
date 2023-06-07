import 'package:application1/src/constants/colors.dart';
import 'package:application1/src/constants/image_strings.dart';
import 'package:application1/src/constants/sizes.dart';
import 'package:application1/src/constants/text_strings.dart';
import 'package:application1/src/features/authentication/screens/login/login_screen.dart';
import 'package:application1/src/features/authentication/screens/signup/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var height = mediaQuery.size.height;
    var brighgtness = mediaQuery.platformBrightness;

    final isDarkMode = brighgtness == Brightness.dark;

    return SafeArea(
      child: Scaffold(
        backgroundColor: isDarkMode ? tSecondaryColor : tPrimaryColor,
        body: Container(
          padding: EdgeInsets.all(tDefaultSize),
          child:
              Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Image(
              image: AssetImage(tWelcomeScreenImage),
              height: height * 0.40,
            ),
            Column(
              children: [
                Text(
                  tWelcomeTitle,
                  style: Theme.of(context).textTheme.headline1,
                ),
                Text(
                  tWelcomeSubTitle,
                  style: Theme.of(context).textTheme.bodyText1,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            //  SizedBox(height: height * 0.05),
            Row(
              children: [
                Expanded(
                    child: OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()),
                          );
                        },
                        child: Text(tLogin.toUpperCase()))),
                SizedBox(width: 10),
                Expanded(
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpScreen()),
                          );
                        }, child: Text(tSignup.toUpperCase()))),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
