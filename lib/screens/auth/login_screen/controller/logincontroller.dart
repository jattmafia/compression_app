import 'dart:convert';

import 'package:compressionapp/utils/appcolors/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../utils/appcolors/appcolors.dart';
import '../../../bottomnavbar/screen/bottomnavbar.dart';

class LoginController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool loading = false;

  login() async {
    loading = true;
    update();
    try {
      Map data = {
        "email": email.text,
        "password": password.text,
      };
      var response = await http.post(Uri.parse("$ApiUrl/login"),
          headers: {"Content-type": "application/json"},
          body: jsonEncode(data));

      var apiresponse = jsonDecode(response.body);
      if (apiresponse['success'] == true) {
        final pref = await SharedPreferences.getInstance();
        pref.setString('token', apiresponse['token']);
        Get.offAll(() => BottomNavigationScreen());
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
