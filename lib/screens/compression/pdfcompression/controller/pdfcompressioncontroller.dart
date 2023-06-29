import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:pdf_compressor/pdf_compressor.dart';

import '../../../../utils/appcolors/appcolors.dart';

class PdfCompressionController extends GetxController {
  String? filepath;
  String? filename;
  bool compressing = false;

  pickpdf() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);

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

  compresspdf() async {
    compressing = true;
    update();
    final Directory triofolder = Directory('/storage/emulated/0/Download/Trio');
    final Directory imagesfolder =
        Directory('/storage/emulated/0/Download/Trio/CompressedPdf');

    if (!await triofolder.exists()) {
      await triofolder.create(recursive: true);
    }

    if (!await imagesfolder.exists()) {
      await imagesfolder.create(recursive: true);
    }
    final String downloadsPath = imagesfolder.path;
    final savePath = '$downloadsPath/$filename$filename';
    try {
      await PdfCompressor.compressPdfFile(
          filepath!, savePath, CompressQuality.MEDIUM);
      compressing = false;
      update();
      Get.snackbar("Success", "Fil saved to Downloads/Trio/CompressedPdf",
          colorText: AppColors().TextColour);
    } catch (e) {
      compressing = false;
      update();
      print(e);
      Get.snackbar("Error", "Something went wrong",
          colorText: AppColors().TextColour);
    }
  }
}
