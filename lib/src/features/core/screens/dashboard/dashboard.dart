import 'package:application1/src/constants/colors.dart';
import 'package:application1/src/features/core/screens/dashboard/assignments.dart';
import 'package:application1/src/features/core/screens/dashboard/home_screen.dart';
import 'package:application1/src/features/core/screens/dashboard/previous_year_paper.dart';
import 'package:application1/src/features/core/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final controller = PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreen() {
    return [const HomeScreen(), const PreviousYearPapers(), const Assignments(), const ProfileScreen()];
  }

  List<PersistentBottomNavBarItem> _navBarItem() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home,color: Color.fromARGB(255, 32, 52, 51),),
        inactiveIcon: const Icon(Icons.home,color: Color.fromARGB(255, 89, 114, 113),),
        
        
        ),
      PersistentBottomNavBarItem(icon: const Icon(Icons.book_online,color: Color.fromARGB(255, 32, 52, 51),),
        inactiveIcon: const Icon(Icons.book_online,color: Color.fromARGB(255, 89, 114, 113),),),

      
      PersistentBottomNavBarItem(icon: const Icon(Icons.assignment,color: Color.fromARGB(255, 32, 52, 51),),
        inactiveIcon: const Icon(Icons.assignment,color: Color.fromARGB(255, 89, 114, 113),),),

PersistentBottomNavBarItem(icon: const Icon(Icons.person,color: Color.fromARGB(255, 32, 52, 51),),
        inactiveIcon: const Icon(Icons.person,color: Color.fromARGB(255, 89, 114, 113),),),


    
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: _buildScreen(),
      items: _navBarItem(),
      controller: controller,
      backgroundColor:tPrimaryColor,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(1),
      ),
    );
  }
}
