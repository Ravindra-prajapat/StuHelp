import 'package:application1/src/constants/colors.dart';
import 'package:application1/src/constants/image_strings.dart';
import 'package:application1/src/constants/sizes.dart';
import 'package:application1/src/constants/text_strings.dart';
import 'package:application1/src/repository/authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

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
            tAppName,
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
              child: IconButton(
                  onPressed: () {
                    AuthenticationRepository.instance.logout();
                  },
                  icon: const Image(
                    image: AssetImage(tUserProfileImage),
                  )),
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
                style: txtTheme.bodyText2,
              ),
              Text(
                tDashboardHeading,
                style: txtTheme.headline2,
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
                      style: txtTheme.headline2
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
                                style: txtTheme.headline1?.apply(
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
                                style: txtTheme.headline1?.apply(
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
                                style: txtTheme.headline1?.apply(
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
