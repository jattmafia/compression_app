import 'package:compressionapp/screens/changepasswrod/controller/changepasswordcontroller.dart';
import 'package:compressionapp/utils/appcolors/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePassword extends StatelessWidget {
  final controller = Get.put(ChangePasswordController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().BackgroundColour,
      body: GetBuilder<ChangePasswordController>(builder: (_) {
        return 
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Change Password",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: AppColors().HeadingColour),
                  ),
                  Text(
                    "Please fill the below fields to continue",
                    style: TextStyle(
                      color: AppColors().TextColour,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  TextFormField(
                    obscureText: true,
                    controller: controller.oldpassword,
                    style: TextStyle(color: AppColors().TextColour),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        filled: true,
                        hintStyle: TextStyle(
                          color: AppColors().TextColour,
                        ),
                        hintText: "Enter old password",
                        fillColor: AppColors().TabbarColour),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    obscureText: true,
                    controller: controller.newpassword,
                    style: TextStyle(color: AppColors().TextColour),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        filled: true,
                        hintStyle: TextStyle(
                          color: AppColors().TextColour,
                        ),
                        hintText: "Enter new password",
                        fillColor: AppColors().TabbarColour),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    obscureText: true,
                    controller: controller.confirmpassword,
                    style: TextStyle(color: AppColors().TextColour),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        filled: true,
                        hintStyle: TextStyle(
                          color: AppColors().TextColour,
                        ),
                        hintText: "Confirm new password",
                        fillColor: AppColors().TabbarColour),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      controller.loading == false ?
                      MaterialButton(
                        onPressed: () {
                          if (controller.oldpassword.text.isEmpty ||
                              controller.newpassword.text.isEmpty ||
                              controller.confirmpassword.text.isEmpty) {
                            Get.snackbar("Error", "Please Select File",
                                colorText: AppColors().TextColour);
                          } else if (controller.newpassword.text !=
                              controller.confirmpassword.text) {
                            Get.snackbar("Error", "assword do not match",
                                colorText: AppColors().TextColour);
                          } else {
                            controller.changepassword();
                          }
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        height: 50,
                        minWidth: 280,
                        color: AppColors().ButtonColour,
                        child: Text(
                          "CHange Password",
                          style: TextStyle(
                              fontSize: 20,
                              color: AppColors().ButtonTextColour),
                        ),
                      ):CircularProgressIndicator(color: AppColors().ButtonColour,),
                    ],
                  ),
                ],
              ),
            );
          
      }),
    );
  }
}
