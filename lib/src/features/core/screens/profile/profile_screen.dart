// import "package:application1/src/constants/image_strings.dart";
// import "package:application1/src/constants/sizes.dart";
// import "package:application1/src/features/core/screens/profile/update_profile_screen.dart";
// import "package:application1/src/features/core/screens/profile/widgets/profile_menu.dart";
// import "package:flutter/material.dart";
// import "package:get/get.dart";
// import "package:line_awesome_flutter/line_awesome_flutter.dart";

// import "../../../../constants/colors.dart";
// import "../../../../constants/text_strings.dart";
// import "../../../../repository/authentication_repository/authentication_repository.dart";

// class ProfileScreen extends StatelessWidget {
//   const ProfileScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;

//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//             onPressed: () => Get.back(),
//             icon: const Icon(LineAwesomeIcons.angle_left)),
//         title: Text(tProfile, style: Theme.of(context).textTheme.headlineMedium),
//         actions: [
//           IconButton(
//               onPressed: () {},
//               icon:
//                   Icon(isDark ? LineAwesomeIcons.sun : LineAwesomeIcons.moon)),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//             padding: const EdgeInsets.all(tDefaultSize),
//             child: Column(
//               children: [
//                 Stack(
//                   children: [
//                     SizedBox(
//                       width: 120,
//                       height: 120,
//                       child: ClipRRect(
//                           borderRadius: BorderRadius.circular(100),
//                           child: const Image(image: AssetImage(tProfileImage))),
//                     ),
//                     Positioned(
//                       bottom: 0,
//                       right: 0,
//                       child: Container(
//                         width: 35,
//                         height: 35,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(100),
//                           color: Colors.grey.withOpacity(0.8),
//                         ),
//                         child: const Icon(
//                           LineAwesomeIcons.alternate_pencil,
//                           size: 20.0,
//                           color: Colors.black,
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Text(
//                   tProfileHeading,
//                   style: Theme.of(context).textTheme.headlineMedium,
//                 ),
//                 Text(
//                   tProfileSubHeading,
//                   style: Theme.of(context).textTheme.bodyMedium,
//                 ),

//                 const SizedBox(
//                   height: 20,
//                 ),

//                 SizedBox(
//                   width: 200,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => const UpdateProfileScreen()),
//                       );
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.grey.withOpacity(0.6),
//                       side: BorderSide.none,
//                       shape: const StadiumBorder(),
//                     ),
//                     child: const Text(
//                       tEditProfile,
//                       style: TextStyle(color: tDarkColor),
//                     ),
//                   ),
//                 ),

//                 const SizedBox(height: 30),
//                 const Divider(),
//                 const SizedBox(height: 10),

//                 // MENU

//                 ProfileMenuWidget(
//                   title: "Settings",
//                   icon: LineAwesomeIcons.cog,
//                   onPress: () {},
//                 ),
//                 ProfileMenuWidget(
//                   title: "Billing Details",
//                   icon: LineAwesomeIcons.wallet,
//                   onPress: () {},
//                 ),
//                 ProfileMenuWidget(
//                   title: "User Management",
//                   icon: LineAwesomeIcons.user_check,
//                   onPress: () {},
//                 ),
//                 const Divider(
//                   color: Colors.grey,
//                 ),
//                 const SizedBox(height: 10),
//                 ProfileMenuWidget(
//                   title: "SInformation",
//                   icon: LineAwesomeIcons.info,
//                   onPress: () {},
//                 ),

//                 ProfileMenuWidget(
//                   title: "Logout",
//                   icon: LineAwesomeIcons.alternate_sign_out,
//                   textColor: Colors.red,
//                   endIcon: false,
//                   onPress: () {
//                     AuthenticationRepository.instance.logout();
//                   },
//                 ),
//               ],
//             )),
//       ),
//     );
//   }
// }

import 'dart:io';

import 'package:application1/src/features/authentication/services/session_mamager.dart';
import 'package:application1/src/features/core/controllers/profile_screen_controller.dart';
import 'package:application1/src/repository/authentication_repository/authentication_repository.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ref = FirebaseDatabase.instance.ref('User');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
          create: (_) => ProfileController(),
          child:
              Consumer<ProfileController>(builder: (context, provider, child) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: StreamBuilder(
                  stream:
                      ref.child(SessionController().userId.toString()).onValue,
                  builder: (context, AsyncSnapshot snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasData) {
                      print(
                          "  userid is ::${SessionController().userId.toString()}");
                      Map<dynamic, dynamic>? map =
                          snapshot.data!.snapshot.value;

                      if (map != null) {
                        return Column(
                          children: [
                            const SizedBox(height: 20),

                            Stack(alignment: Alignment.bottomCenter, children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 11,
                                ),
                                child: Center(
                                  child: Container(
                                    height: 130,
                                    width: 130,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: Colors.grey, width: 3),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: provider.image == null
                                          ? (map['profile'].toString() == ""
                                              ? const Image(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                    'https://www.dgvaishnavcollege.edu.in/dgvaishnav-c/uploads/2021/01/dummy-profile-pic.jpg.webp',
                                                  ),
                                                )
                                              : Image(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                      map['profile']
                                                          .toString()),
                                                  loadingBuilder: (context,
                                                      child, loadingProgress) {
                                                    if (loadingProgress == null)
                                                      return child;
                                                    return const Center(
                                                      child:
                                                          CircularProgressIndicator(),
                                                    );
                                                  },
                                                  errorBuilder:
                                                      (context, object, stack) {
                                                    return Container(
                                                      child:const Image(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                    'https://www.dgvaishnavcollege.edu.in/dgvaishnav-c/uploads/2021/01/dummy-profile-pic.jpg.webp',
                                                  ),
                                                )
                                                    );
                                                  },
                                                ))
                                          : Stack(
                                            children: [
                                              Image.file(
                                                  File(provider.image!.path)
                                                      .absolute,
                                                ),
                                                 Center(child: CircularProgressIndicator()),
                                            ],
                                          ),
                                          
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  provider.pickImage(context);
                                },
                                child: const CircleAvatar(
                                  radius: 15,
                                  backgroundColor:
                                      Color.fromARGB(255, 59, 83, 21),
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ]),

                            const SizedBox(
                              height: 20,
                            ),

                            // user data display on profile screen

                            ReusableRow(
                                title: 'Username',
                                value: map['userName'],
                                iconData: Icons.person),
                            ReusableRow(
                                title: 'Phone',
                                value: map['phone'],
                                iconData: Icons.phone_outlined),
                            ReusableRow(
                                title: 'Email',
                                value: map['email'],
                                iconData: Icons.email_outlined),

                            const SizedBox(
                              height: 40,
                            ),

                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  AuthenticationRepository.instance.logout();
                                },
                                child: Text(
                                  "Logout",
                                  style: Theme.of(context).textTheme.headline4,
                                ),
                              ),
                            ),
                          ],
                        );
                      } else {
                        return const Center(child: Text("Data is null"));
                      }
                    } else {
                      return const Center(child: Text("Something went wrong"));
                    }
                  },
                ),
              ),
            );
          })),
    );
  }
}

class ReusableRow extends StatelessWidget {
  final String title, value;
  final IconData iconData;
  const ReusableRow(
      {Key? key,
      required this.title,
      required this.value,
      required this.iconData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            title,
            style: Theme.of(context).textTheme.headline4,
          ),
          leading: Icon(
            iconData,
            color: const Color.fromARGB(255, 43, 38, 38),
          ),
          trailing: Text(
            value,
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
        Divider(
          color: Colors.grey,
        )
      ],
    );
  }
}
