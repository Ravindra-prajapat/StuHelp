import 'package:application1/src/features/core/screens/dashboard/dashboard.dart';
import 'package:flutter/material.dart';

import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';
import '../forget_password/forget_password_options/forget_password_btn_widget.dart';
import '../forget_password/forget_password_options/forget_password_model_bottom_sheet.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Container(
      padding: EdgeInsets.symmetric(vertical: tFormHeight - 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person_outline_outlined),
                labelText: tEmail,
                hintText: tEmail,
                border: OutlineInputBorder()),
          ),
          const SizedBox(
            height: tFormHeight - 20,
          ),
          TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.fingerprint),
              labelText: tPassword,
              hintText: tPassword,
              border: OutlineInputBorder(),
              suffixIcon: IconButton(
                  onPressed: null, icon: Icon(Icons.remove_red_eye_sharp)),
            ),
          ),
          const SizedBox(
            height: tFormHeight - 20,
          ),
          Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: () {
                    ForgetPasswordScreen.buildShowModelBottomSheet(context);
                  },
                  child: const Text(tForgetPassword))),
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                              const Dashboard(),
                        ),
                      );
                          },
                  child: Text(tLogin.toUpperCase()))),
        ],
      ),
    ));
  }
}
