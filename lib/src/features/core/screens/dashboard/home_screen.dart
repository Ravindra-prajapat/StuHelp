import 'package:application1/src/constants/colors.dart';
import 'package:application1/src/constants/image_strings.dart';
import 'package:application1/src/constants/sizes.dart';
import 'package:application1/src/constants/text_strings.dart';
import 'package:application1/src/features/core/screens/profile/widgets/profile_menu.dart';
import 'package:application1/src/repository/authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final txtTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(

          leading: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
          title: Text(
            "StudentHelper-NITKKR",
            style: Theme.of(context).textTheme.headline4,
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: [
            Container(


              margin: const EdgeInsets.only(right: 20, top: 7),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: tCardBgColor),
             
             
                  
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDashboardPadding),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                tDashboardTitle,
                style: txtTheme.bodyMedium,
              ),
              Text(
                tDashboardHeading,
                style: txtTheme.displayMedium,
              ),
              const SizedBox(
                height: tDashboardPadding,
              ),

              //search box
              Container(
                decoration: const BoxDecoration(
                  border: Border(left: BorderSide(width: 4)),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      tDashboardSearch,
                      style: txtTheme.displayMedium
                          ?.apply(color: Colors.grey.withOpacity(0.5)),
                    ),
                    const Icon(
                      Icons.mic,
                      size: 20,
                    ),
                  ],
                ),
              ),

              // Categories
              const SizedBox(
                height: 200,
              ),
              SizedBox(
                height: 150,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(
                      width: 250,
                      height: 150,
                      child: Row(
                        children: [
                          Container(
                            width: 250,
                            height: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: tDarkColor),
                            child: Center(
                              child: Text(
                                "Previous Year Paper",
                                style: txtTheme.displayLarge?.apply(
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      width: 250,
                      height: 150,
                      child: Row(
                        children: [
                          Container(
                            width: 250,
                            height: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: tDarkColor),
                            child: Center(
                              child: Text(
                                "Previous Year Paper",
                                style: txtTheme.displayLarge?.apply(
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      width: 250,
                      height: 150,
                      child: Row(
                        children: [
                          Container(
                            width: 250,
                            height: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: tDarkColor),
                            child: Center(
                              child: Text(
                                "Previous Year Paper",
                                style: txtTheme.displayLarge?.apply(
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
