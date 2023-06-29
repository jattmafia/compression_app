import 'package:compressionapp/screens/auth/login_screen/screen/loginscreen.dart';
import 'package:compressionapp/screens/changepasswrod/screen/changepasswordscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/appcolors/appcolors.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().BackgroundColour,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Settings",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: AppColors().HeadingColour),
            ),
            SizedBox(
              height: 30,
            ),
            ListTile(
                onTap: () {
                  Get.to(() => ChangePassword());
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                tileColor: AppColors().TabbarColour,
                leading: Icon(
                  Icons.lock,
                  size: 30,
                  color: AppColors().TextColour,
                ),
                title: Text(
                  "Change Password",
                  style: TextStyle(fontSize: 20, color: AppColors().TextColour),
                ),
                trailing: Icon(
                  CupertinoIcons.forward,
                  size: 30,
                  color: AppColors().TextColour,
                )),
            SizedBox(
              height: 30,
            ),
            ListTile(
              onTap: () async {
                final pref = await SharedPreferences.getInstance();
                pref.clear();
                Get.offAll(()=>LogInScreen());
              },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                tileColor: AppColors().TabbarColour,
                leading: Icon(
                  Icons.logout,
                  size: 30,
                  color: AppColors().TextColour,
                ),
                title: Text(
                  "Logout",
                  style: TextStyle(fontSize: 20, color: AppColors().TextColour),
                ),
                trailing: Icon(
                  CupertinoIcons.forward,
                  size: 30,
                  color: AppColors().TextColour,
                ))
          ],
        ),
      )),
    );
  }
}
