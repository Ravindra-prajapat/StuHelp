import 'package:application1/src/constants/colors.dart';
import 'package:application1/src/constants/sizes.dart';
import 'package:flutter/material.dart';

import 'login_footer_widget.dart';
import 'login_form_widget.dart';
import 'login_header_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor:  tPrimaryColor,
          body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child:
           Column(
            crossAxisAlignment: CrossAxisAlignment. start, children: [
             LoginHeaderWidget(size: size), // header

            const LoginForm(),  // middel

            const LoginFooterWidget(),  // footer



          ]),
        ),
      )),
    );
  }
}

