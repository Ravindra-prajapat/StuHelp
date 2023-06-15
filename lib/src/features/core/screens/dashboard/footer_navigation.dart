import 'package:application1/src/features/core/screens/dashboard/dashboard.dart';
import 'package:application1/src/features/core/screens/dashboard/previous_year_paper.dart';
import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/image_strings.dart';
import '../../../../constants/text_strings.dart';
import '../profile/profile_screen.dart';
import 'assignments.dart';

class FooterNavigation extends StatefulWidget {
  const FooterNavigation({super.key});

  @override
  State<FooterNavigation> createState() => _FooterNavigationState();
}

class _FooterNavigationState extends State<FooterNavigation> {
  int myIndex = 0;
  List pages = [const Dashboard(),const PreviousYearPapers(), const Assignments()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
          title: Text(
            tAppName,
            style: Theme.of(context).textTheme.headlineMedium,
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProfileScreen()),
                    );
                  },
                  icon: const Image(
                    image: AssetImage(tUserProfileImage),
                  )),
            )
          ],
        ),
      body: pages[myIndex],

      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              myIndex = index;
            });
          },
          currentIndex: myIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.book_online), label: "PYQ"),
            BottomNavigationBarItem(
                icon: Icon(Icons.assessment), label: "Assgements"),
          ],
        ),
    );
    
  }
}