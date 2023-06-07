
import 'package:application1/src/constants/image_strings.dart';
import 'package:application1/src/constants/sizes.dart';
import 'package:application1/src/constants/text_strings.dart';
import 'package:flutter/material.dart';

import '../../../../../common_widgets/form/form_header_widget.dart';
import '../forget_password_otp/otp_screen.dart';

class ForgetPasswordPhoneScreen extends StatelessWidget {
  const ForgetPasswordPhoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              children: [
                const SizedBox(height: tDefaultSize*4,),
                const FormHeaderWidget(
                      image: tForgetPasswordImage,
                      title: tForgetPassword,
                      subTitle: tForgetMailSubTitle,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      heightBetween: 30.0,
                      textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: tFormHeight,),
        
                  Form(
                    child: Column(
                      children:  [
                        TextFormField(
                          decoration: const InputDecoration(
                            label: Text(tPhoneNo),
                            hintText:tPhoneNo,
                            prefixIcon: Icon(Icons.mobile_friendly_rounded),
                        ),
                        ),
                        const SizedBox(height: 20.0,),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                              const OTPScreen(),
                        ),
                      );
                          }, child: const Text(tNext)))
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}