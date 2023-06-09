
import 'package:application1/src/constants/colors.dart';
import 'package:application1/src/constants/image_strings.dart';
import 'package:application1/src/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../../constants/text_strings.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Get.back(), icon: const Icon(LineAwesomeIcons.angle_left)),
        title: Text(tProfile, style: Theme.of(context).textTheme.headline4),
        actions: [
          IconButton(
              onPressed: () {},
              icon:
                  Icon(isDark ? LineAwesomeIcons.sun : LineAwesomeIcons.moon)),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: Column(children: [
            Stack(
              children: [
                SizedBox(
                  width: 120,
                  height: 120,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: const Image(image:AssetImage(tProfileImage)),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 35, height: 35,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),color: Colors.yellow),
                    child: const Icon(LineAwesomeIcons.camera,
                    color:Colors.black,
                    size: 20,
                    ),
                  ),
                
                )
              ],
            )
          ,
          const SizedBox(height: 50),
          Form(
            child:Column(
              children: [
                TextFormField(
                  
                  decoration: const InputDecoration(
                    label: Text(tFullName),
                    prefixIcon: Icon(Icons.person_outline_rounded),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: tFormHeight - 20,
                ),
                TextFormField(
                  
                  decoration: const InputDecoration(
                    label: Text(tEmail),
                    prefixIcon: Icon(Icons.email_outlined),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: tFormHeight - 20,
                ),
                TextFormField(
                  
                  decoration: const InputDecoration(
                    label: Text(tPhoneNo),
                    prefixIcon: Icon(Icons.phone_outlined),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: tFormHeight - 20,
                ),
                TextFormField(
                
                  decoration: const InputDecoration(
                    label: Text(tPassword),
                    prefixIcon: Icon(Icons.fingerprint),
                    border: OutlineInputBorder(),
                  ),
                ),

                SizedBox(height: tFormHeight,),

                SizedBox(
                  width :double.infinity,
                  child: ElevatedButton(
                    onPressed: ()=>Get.to(()=>UpdateProfileScreen()),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow,side :BorderSide.none,  
                      shape: const StadiumBorder()),
                      child: const Text(tEditProfile,style: TextStyle(color: tDarkColor),),
                  ),
                )
              ],
            )
          )
          ]),
        ),
      ),
    );
  }
}