import 'dart:convert';

import 'package:compressionapp/screens/auth/login_screen/screen/loginscreen.dart';
import 'package:compressionapp/utils/appcolors/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../../utils/appcolors/appcolors.dart';

class SignupController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confpassword = TextEditingController();
  TextEditingController name = TextEditingController();
  bool loading = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  signup() async {
    loading = true;
    update();
    try {
      Map data = {
        "email": email.text,
        "password": password.text,
        "fullname": name.text
      };
      print(data);
      var response = await http.post(
          Uri.parse("$ApiUrl/signup"),
          headers: {"Content-type": "application/json"},
          body: jsonEncode(data));

      var apiresponse = jsonDecode(response.body);
      print("aaa $apiresponse");
      if (apiresponse['success'] == true) {
        Get.snackbar("Success", "User registered successfully",
            colorText: AppColors().TextColour);
        
        Get.to(() => LogInScreen());
        loading = false;
        update();
      }
      if (apiresponse['success'] == false) {
         loading = false;
        update();
        Get.snackbar("Success", apiresponse['error'],
            colorText: AppColors().TextColour);
      }
    } catch (e) {
       loading = false;
         Get.snackbar("Success", "Something went wrong",
            colorText: AppColors().TextColour);
        update();
      print(e);
    }
  }
}
