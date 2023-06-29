import 'package:compressionapp/utils/appcolors/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/videocompressionController.dart';

class VideoCompressionScreen extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
     final VideoCompressionController videoCompressionController =
      Get.put(VideoCompressionController());
    return Scaffold(
      backgroundColor: AppColors().BackgroundColour,
      body:
          SafeArea(child: GetBuilder<VideoCompressionController>(builder: (_) {
        return Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  videoCompressionController.thumbnail != null
                      ? Image.memory(
                          videoCompressionController.thumbnail!,
                          height: Get.height * .6,
                        )
                      : SizedBox(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      videoCompressionController.videoFile == null
                          ? MaterialButton(
                              onPressed: () {
                                videoCompressionController.pickvideo();
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              height: 50,
                              minWidth: 280,
                              color: AppColors().ButtonColour,
                              child: Text(
                                "Select Video",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: AppColors().ButtonTextColour),
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: MaterialButton(
                                onPressed: () {
                                  videoCompressionController.compressvideo();
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                height: 50,
                                minWidth: 280,
                                color: AppColors().ButtonColour,
                                child: Text(
                                  "Compress Video",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: AppColors().ButtonTextColour),
                                ),
                              ),
                            ),
                    ],
                  ),
                ],
              ),
              videoCompressionController.compressing == true
                  ? Container(
                      height: Get.height,
                      width: Get.width,
                      color: Colors.black38,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 80,right: 80),
                              child: LinearProgressIndicator(
                                color: AppColors().ButtonColour,
                              ),
                            ),
                            SizedBox(height: 5,),
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
