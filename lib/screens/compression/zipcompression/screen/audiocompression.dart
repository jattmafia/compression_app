import 'package:compressionapp/utils/appcolors/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/zipcontroller.dart';

class ZipCompressScreen extends StatelessWidget {
  final controller = Get.put(ZipCompressController());
 Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors().BackgroundColour,
        body: GetBuilder<ZipCompressController>(builder: (_) {
          return Stack(
            alignment: Alignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: GestureDetector(
                      onTap: () {
                        controller.pickdoc();
                      },
                      child: Container(
                        width: Get.width,
                        height: Get.height * .33,
                        decoration: BoxDecoration(
                            color: AppColors().TabbarColour,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Center(
                          child: Text(
                            controller.filename == null
                                ? "Click To Select File"
                                : controller.filename.toString(),
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: AppColors().TextColour),
                          ),
                        ),
                      ),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      if (controller.filepath == null) {
                        Get.snackbar("Error", "Please Select File",
                            colorText: AppColors().TextColour);
                      } else {
                        controller.compresszip();
                      }
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    height: 50,
                    minWidth: 280,
                    color: AppColors().ButtonColour,
                    child: Text(
                      "Compress Zip",
                      style: TextStyle(
                          fontSize: 20, color: AppColors().ButtonTextColour),
                    ),
                  ),
                ],
              ),
              controller.compressing == true
                  ? Container(
                      height: Get.height,
                      width: Get.width,
                      color: Colors.black38,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 80, right: 80),
                              child: LinearProgressIndicator(
                                color: AppColors().ButtonColour,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Compressing Please Wait",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    )
                  : SizedBox()
            ],
          );
        }));
  }
}
