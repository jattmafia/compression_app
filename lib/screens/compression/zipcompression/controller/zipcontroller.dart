import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:path/path.dart' as path;
import 'package:archive/archive_io.dart';

import '../../../../utils/appcolors/appcolors.dart';

class ZipCompressController extends GetxController {
  String? filepath;
  String? filename;
  bool compressing = false;
  pickdoc() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom, allowedExtensions: ['jpg', 'png', 'mp3','docx','doc']);

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

  compresszip() async {
    compressing = true;
    update();
    final Directory triofolder = Directory('/storage/emulated/0/Download/Trio');
    final Directory zipfolder =
        Directory('/storage/emulated/0/Download/Trio/Zip');
    if (!await triofolder.exists()) {
      await triofolder.create(recursive: true);
    }

    if (!await zipfolder.exists()) {
      await zipfolder.create(recursive: true);
    }
    try {
      final bytes = await File(filepath!).readAsBytes();
      final archeivefile = ArchiveFile(filename!, bytes.length, bytes);
      final archieve = Archive();
      archieve.addFile(archeivefile);
      final zipencoder = ZipEncoder();
      final encodedarcheive = zipencoder.encode(archieve);
      if (encodedarcheive == null) {
        return print("empty");
      }
      final savePath = '${zipfolder.path}/${filename}compressed.zip';
      final zipfile = await File(savePath).writeAsBytes(encodedarcheive);
      compressing = false;
      update();
      Get.snackbar("Success",
          "File Successfully Compressed And Saved To Download/Trio/Zip Folder",
          colorText: AppColors().TextColour);
    } catch (e) {
       compressing = false;
        update();
      Get.snackbar("Success",
          "Something went wrong",
          colorText: AppColors().TextColour);
      update();
      print(e);
    }
  }
}
