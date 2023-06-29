import 'dart:convert';
import 'dart:io';

import 'package:compressionapp/utils/appcolors/appcolors.dart';
import 'package:compressionapp/utils/appcolors/constant.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ConvertController extends GetxController {

  String? filepath;
  String? filename;
  bool compressing = false;
  pickdoc() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['docx']);

    if (result != null) {
      PlatformFile doc = result.files.first;
      filepath = doc.path;
      filename = doc.name;

      update();
      print(filepath);
    } else {
      print("User canceled the picker");
    }
  }

  convertfile() async {
    compressing = true;
    update();
    try {
      print(ApiUrl);
      var request =
          http.MultipartRequest('POST', Uri.parse("$ApiUrl/docxtopdf"));
      request.headers.addAll({});
      var b = await http.MultipartFile.fromPath("file", filepath!);
      request.files.add(b);
      final response = await request.send();
      var data = await response.stream.bytesToString();
      var responsedata = jsonDecode(data);
      print(responsedata["convertedpdf"]);
      downloadFile("$ApiUrlAlone/${responsedata["convertedpdf"]}",
          responsedata["convertedpdf"]);
    } catch (e) {
      compressing = false;
      update();
      Get.snackbar("Error", "Something went wrong please check internet",
          colorText: AppColors().TextColour);
      print(e);
    }
  }

  downloadFile(String url, String fileName) async {
    final Directory triofolder = Directory('/storage/emulated/0/Download/Trio');
    final Directory imagesfolder =
        Directory('/storage/emulated/0/Download/Trio/ConvertedPdf');

    if (!await triofolder.exists()) {
      await triofolder.create(recursive: true);
    }

    if (!await imagesfolder.exists()) {
      await imagesfolder.create(recursive: true);
    }
    final String downloadsPath = '${imagesfolder.path}';
    final savePath = '$downloadsPath/$filename$fileName';
    var dio = Dio();

    var response = await dio.download(url, savePath);
    print(response);
    compressing = false;
    update();
    Get.snackbar("Success", "File saved to Downloads/Trio/convertpdf",
        colorText: AppColors().TextColour);
  }
}
