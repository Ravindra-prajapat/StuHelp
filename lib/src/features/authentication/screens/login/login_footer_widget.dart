import 'package:application1/src/features/authentication/screens/signup/signup_screen.dart';
import 'package:flutter/material.dart';

import '../../../../constants/image_strings.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';

class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "OR",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(
          height: tFormHeight - 20,
        ),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
              icon: const Image(
                image: AssetImage(tGoogleLogoImage),
                width: 20.0,
              ),
              onPressed: () {},
              label: const Text(tSignInWithGoogle)),
        ),
        const SizedBox(
          height: tFormHeight - 20,
        ),
        TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const SignUpScreen(),
                  ));
            },
            child: Text.rich(
                    TextSpan(children: [
                      TextSpan(text: tDontHaveAnAccount,style: Theme.of(context).textTheme.bodyLarge),
                      TextSpan(text: tSignup.toUpperCase()),
                    ])
                  ),
                ),
      ],
    );
  }
}
