import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:image/image.dart' as IMG;

import '../../../../utils/appcolors/appcolors.dart';

class ImageCompressionController extends GetxController {
  String? docPath;
  String? imgname;
  bool imgpick = false;
  bool compressing = false;

  pickimage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom, allowedExtensions: ['jpg', 'jpeg', 'png']);

    if (result != null) {
      PlatformFile doc = result.files.first;
      docPath = doc.path;
      imgname = doc.name;
      print(imgname);
      imgpick = true;
      update();
      print(docPath);
    } else {
      print("User canceled the picker");
    }
  }

  compressimage() async {
    compressing = true;
    update();
    final img = await compute(ReduceImageQualityAndSize2, docPath);
    String filename = imgname!.split(".").first;
    final Directory triofolder = Directory('/storage/emulated/0/Download/Trio');
    final Directory imagesfolder =
        Directory('/storage/emulated/0/Download/Trio/Images');

    if (!await triofolder.exists()) {
      await triofolder.create(recursive: true);
    }

    if (!await imagesfolder.exists()) {
      await imagesfolder.create(recursive: true);
    }
    final String downloadsPath = imagesfolder.path;
    final savePath = '$downloadsPath/${filename}compressed.jpg';
    await File(savePath).writeAsBytes(img);
    compressing = false;
    Get.snackbar("Success",
        "Image Successfully Compressed And Saved To Download/Trio/CompressedImage Folder",
        colorText: AppColors().TextColour);
    update();
  }
}

ReduceImageQualityAndSize2(docPath) async {
  Uint8List image = File(docPath!).readAsBytesSync();
  Uint8List resizedData = Uint8List.fromList(image);

  IMG.Image? img = await IMG.decodeImage(image);
  int size = await image.lengthInBytes;
  double maxInBytes = size / 1.5;
  int quality = 100;

  print("size max: " + maxInBytes.toString());
  print("size before: " + size.toString() + " bytes");

  while (size > maxInBytes && quality > 10) {
    // reduce image size about 10% of image, until the size is less than the maximum limit
    quality = (quality - (quality * 0.1)).toInt();
    int width = img!.width - (img.width * 0.1).toInt();
    IMG.Image resized = await IMG.copyResize(img, width: width);
    resizedData =
        await Uint8List.fromList(IMG.encodeJpg(resized, quality: quality));
    size = await resizedData.lengthInBytes;
    img = resized;
  }

  print("size after: " + size.toString() + " bytes");
  return resizedData;
}
