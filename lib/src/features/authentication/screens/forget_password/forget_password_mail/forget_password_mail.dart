
import 'package:application1/src/constants/sizes.dart';
import 'package:application1/src/constants/text_strings.dart';
import 'package:application1/src/features/authentication/controllers/forgot_password_mail_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';




class ForgetPasswordMailScreen extends StatelessWidget {
  const ForgetPasswordMailScreen({super.key});

  static final GlobalKey<FormState> _formKey =
      GlobalKey<FormState>(); // Update the GlobalKey

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!GetUtils.isEmail(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

 
   @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var height = mediaQuery.size.height;
    var brighgtness = mediaQuery.platformBrightness;

    final isDarkMode = brighgtness == Brightness.dark;
    final controller = Get.put(ForgotPasswordController());
    final email = TextEditingController();
    final password = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            
            Center(child: Text("Forgot Password",style:Theme.of(context).textTheme.headline2)),
            const SizedBox(height: 10,),
            Center(child: Text("Please check your email ",style: Theme.of(context).textTheme.bodyText1,)),
            Container(
              padding: EdgeInsets.only(left: 30,right: 30 ,top: height*.1),
              child: Form(
                key: _formKey,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: tFormHeight - 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: controller.email,
                        decoration: const InputDecoration(
                          label: Text(tEmail),
                          prefixIcon: Icon(Icons.email_outlined),
                          border: OutlineInputBorder(),
                        ),
                        validator: validateEmail,
                      ),
                      const SizedBox(
                        height: tFormHeight,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              ForgotPasswordController.instance.reset();
                            }
                          },
                          child: Text("Recover".toUpperCase()),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
