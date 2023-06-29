import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import '../../../utils/appcolors/appcolors.dart';

class PdfMakerController extends GetxController {
  TextEditingController filenamecontroller = TextEditingController();
  TextEditingController pdftextcontroller = TextEditingController();
  bool working = false;

  pdfmaker() async {
    working = true;
    update();
    final Directory triofolder = Directory('/storage/emulated/0/Download/Trio');
    final Directory pdffolder =
        Directory('/storage/emulated/0/Download/Trio/PdfMaker');
    if (!await triofolder.exists()) {
      await triofolder.create(recursive: true);
    }

    if (!await pdffolder.exists()) {
      await pdffolder.create(recursive: true);
    }
    try {
      working = false;
      update();

      final pdf = pw.Document();
      pdf.addPage(pw.Page(
          pageFormat: PdfPageFormat.a4,
          build: (pw.Context context) => pw.Center(
                child: pw.Text(pdftextcontroller.text),
              )));
      final file = File("${pdffolder.path}/${filenamecontroller.text}.pdf");
      await file.writeAsBytes(await pdf.save());
      working = false;
      pdftextcontroller.clear();
      filenamecontroller.clear();
      update();
      Get.snackbar("Success",
          "File Successfully Compressed And Saved To Download/Trio/Zip Folder",
          colorText: AppColors().TextColour);
    } catch (e) {
      working = false;
      update();
      Get.snackbar("Success", "Something went wrong",
          colorText: AppColors().TextColour);
      update();
      print(e);
    }
  }
}
