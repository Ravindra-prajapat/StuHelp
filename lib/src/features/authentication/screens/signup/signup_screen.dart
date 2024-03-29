import 'package:application1/src/common_widgets/form/form_header_widget.dart';
import 'package:application1/src/constants/colors.dart';
import 'package:application1/src/constants/image_strings.dart';
import 'package:application1/src/constants/sizes.dart';
import 'package:application1/src/constants/text_strings.dart';
import 'package:application1/src/features/authentication/screens/login/login_screen.dart';
import 'package:application1/src/features/authentication/screens/signup/widgets/signup_form_widget.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var brighgtness = mediaQuery.platformBrightness;

    final isDarkMode = brighgtness == Brightness.dark;

    return SafeArea(
      child: Scaffold(
        backgroundColor: isDarkMode ? tSecondaryColor : tPrimaryColor,
        body: SingleChildScrollView(
            child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: Column(
            children:  [
              const FormHeaderWidget(
                  image: tWelcomeScreenImage,
                  title: tSignUpTitle,
                  subTitle: tSignUpSubTitle),
              const SignUpFormWidget(),
          
              Column(
                children: [
                  Text("OR",style: Theme.of(context).textTheme.bodyLarge,),
                   const SizedBox(height: tFormHeight-20,),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Image(
                        image: AssetImage(tGoogleLogoImage),
                        width: 20.0,
                      ),
                      label: Text(tSignInWithGoogle.toUpperCase()),
                    ),
                  ),
                  TextButton(onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const LoginScreen(),
                  ));
            }, child: Text.rich(
                    TextSpan(children: [
                      TextSpan(text: tAlreadyHaveAnAccount,style: Theme.of(context).textTheme.bodyLarge),
                      TextSpan(text: tLogin.toUpperCase()),
                    ])
                  ),
                  ),
                ],
              ),
            ],
          ),
        )),
      ),
    );
  }
}
