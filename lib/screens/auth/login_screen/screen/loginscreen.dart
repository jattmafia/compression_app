import 'package:compressionapp/screens/auth/signup_screen/screen/signupscreen.dart';
import 'package:compressionapp/screens/dashboard/dashboardscreen.dart';
import 'package:compressionapp/utils/appcolors/appcolors.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../bottomnavbar/screen/bottomnavbar.dart';
import '../controller/logincontroller.dart';

class LogInScreen extends StatelessWidget {
  final controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().BackgroundColour,
      body: SafeArea(
          child: GetBuilder<LoginController>(
            builder: (context) {
              return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: controller.formKey,
          child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10,),
                  Text(
                    "Login",
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
                    controller: controller.email,
                    style: TextStyle(color: AppColors().TextFieldInputColor),
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.mail,
                          color: AppColors().TextFieldIconColour,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide: BorderSide.none,
                        ),
                        hintStyle: TextStyle(color: AppColors().TextColour),
                        filled: true,
                        fillColor: AppColors().TextFieldColour,
                        hintText: 'Email'),
                        validator: (value) {
                        if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      } else if (!EmailValidator.validate(value.toString())) {
                        return 'Please enter correct email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: controller.password,
                    obscureText: true,
                    style: TextStyle(color: AppColors().TextFieldInputColor),
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock,
                          color: AppColors().TextFieldIconColour,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide: BorderSide.none,
                        ),
                        hintStyle: TextStyle(color: AppColors().TextColour),
                        filled: true,
                        fillColor: AppColors().TextFieldColour,
                        hintText: 'Password'),
                        validator: (value) {
                        if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      } 
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      controller.loading == false ?
                      MaterialButton(

                        onPressed: () {
                          if(controller.formKey.currentState!.validate()){
                           controller.login();
                          }
                          
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        height: 50,
                        minWidth: 250,
                        color: AppColors().ButtonColour,
                        child: Text(
                          "Log In",
                          style: TextStyle(
                              fontSize: 20, color: AppColors().ButtonTextColour),
                        ),
                      ):CircularProgressIndicator(color: AppColors().ButtonColour,),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have a aaccount? ",
                        style: TextStyle(color: AppColors().TextColour),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => SignUpScreen());
                        },
                        child: Text(
                          "SignUp",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors().ButtonColour),
                        ),
                      )
                    ],
                  )
                ],
          ),
        ),
      );
            }
          )),
    );
  }
}
