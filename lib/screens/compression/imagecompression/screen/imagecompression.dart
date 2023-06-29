import 'dart:io';
import 'package:compressionapp/screens/compression/imagecompression/controller/imagecompression_controller.dart';
import 'package:compressionapp/utils/appcolors/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageCompressionScreen extends StatelessWidget {
  final ImageCompressionController imageCompressionController =
      Get.put(ImageCompressionController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().BackgroundColour,
      body:
          SafeArea(child: GetBuilder<ImageCompressionController>(builder: (_) {
        return
            // imageCompressionController.loading == true ?
            //    Center(child: CircularProgressIndicator()):
            Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    imageCompressionController.docPath != null
                        ? Image.file(
                            File("${imageCompressionController.docPath!}"),
                            // height: Get.height * .65,
                            // fit: BoxFit.fitHeight,
                          )
                        : SizedBox(),
                    imageCompressionController.docPath != null
                        ? SizedBox(
                            height: 20,
                          )
                        : SizedBox(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        imageCompressionController.docPath != null
                            ? MaterialButton(
                                onPressed: () {
                                  imageCompressionController.compressimage();
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                height: 50,
                                minWidth: 280,
                                color: AppColors().ButtonColour,
                                child: Text(
                                  "Compress Image",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: AppColors().ButtonTextColour),
                                ),
                              )
                            : MaterialButton(
                                onPressed: () {
                                  imageCompressionController.pickimage();
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                height: 50,
                                minWidth: 280,
                                color: AppColors().ButtonColour,
                                child: Text(
                                  "Select Image",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: AppColors().ButtonTextColour),
                                ),
                              )
                      ],
                    ),
                  ],
                ),
              ),
              imageCompressionController.compressing == true
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
          ),
        );
      })),
    );
  }
}
