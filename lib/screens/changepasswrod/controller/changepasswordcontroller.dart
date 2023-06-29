import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../utils/appcolors/appcolors.dart';
import '../../../utils/appcolors/constant.dart';

class ChangePasswordController extends GetxController {
  TextEditingController oldpassword = TextEditingController();
  TextEditingController newpassword = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  bool loading = false;

  changepassword() async {
    final pref = await SharedPreferences.getInstance();
    var token = pref.getString('token');
    loading = true;
    update();
    try {
      Map data = {
        "oldpassword": oldpassword.text,
        "newpassword": newpassword.text,
      };
      var response = await http.post(Uri.parse("$ApiUrl/changepassword"),
          headers: {
            'Accept': "application/json",
            'Content-type': 'application/json',
            "Authorization": "Bearer $token"
          },
          body: jsonEncode(data));

      var apiresponse = jsonDecode(response.body);
      print(apiresponse);

      if (apiresponse['success'] == true) {
        Get.snackbar("Success", "Password change successfully",
            colorText: AppColors().TextColour);
        loading = false;
        update();
      }
      if (apiresponse['success'] == false) {
        loading = false;
        update();
        Get.snackbar("Success", apiresponse['message'],
            colorText: AppColors().TextColour);
      }
    } catch (e) {
      loading = false;
      Get.snackbar("Success", "Something went wrong",
          colorText: AppColors().TextColour);
      oldpassword.clear();
      newpassword.clear();
      confirmpassword.clear();
      update();
      print(e);
    }
  }
}
