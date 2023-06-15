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
      crossAxisAlignment: CrossAxisAlignment. center, 
      children: [
        Text("OR",style: Theme.of(context).textTheme.bodyLarge,),

        const SizedBox(height: tFormHeight-20,),

       SizedBox(
        width: double.infinity,
         child: OutlinedButton.icon(
          icon: const Image(image: AssetImage(tGoogleLogoImage), width: 20.0,),
          onPressed: (){}, label: const Text(tSignInWithGoogle)),
       ),

       const SizedBox( height:  tFormHeight-20,),
       TextButton(onPressed: (){}, child: Text.rich(TextSpan(
        text: tDontHaveAnAccount,
        style: Theme.of(context).textTheme.bodyLarge,
        children: const [
          TextSpan(text: tSignup),
        ]
        ))),

       

      ],
    );
  }
}

