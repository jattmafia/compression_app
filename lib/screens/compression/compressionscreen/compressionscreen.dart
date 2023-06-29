import 'package:compressionapp/screens/compression/zipcompression/screen/audiocompression.dart';
import 'package:compressionapp/screens/compression/imagecompression/screen/imagecompression.dart';
import 'package:compressionapp/screens/compression/pdfcompression/screen/pdfcompression.dart';
import 'package:compressionapp/screens/compression/video_compression/screen/videocompresssion_screen.dart';
import 'package:compressionapp/utils/appcolors/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompressionScreen extends StatelessWidget {
  double hh = Get.height * .1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().BackgroundColour,
      body: Padding(
        padding: EdgeInsets.only(top: hh),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          padding: EdgeInsets.only(left: 20, right: 20),
          children: [
            GestureDetector(
              onTap: () {
                Get.to(() => ImageCompressionScreen());
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: AppColors().ButtonColour,
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.image,
                      size: 35,
                      color:AppColors().HeadingColour
                      ),
                      Text(
                        "Image",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: AppColors().HeadingColour),
                      ),
                       Text(
                        "Compression",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: AppColors().HeadingColour),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(() => VideoCompressionScreen());
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: AppColors().ButtonColour,
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       Icon(Icons.video_camera_back,
                      size: 35,
                      color:AppColors().HeadingColour
                      ),
                      Text(
                        "Video",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: AppColors().HeadingColour),
                      ),
                      Text(
                        "Compression",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: AppColors().HeadingColour),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(() => ZipCompressScreen());
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: AppColors().ButtonColour,
                ),
                child: Center(
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       Icon(Icons.folder_zip,
                      size: 35,
                      color:AppColors().HeadingColour
                      ),
                      Text(
                        "Zip",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: AppColors().HeadingColour),
                      ),
                      Text(
                        "Compression",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: AppColors().HeadingColour),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(() => PdfCompressionScreen());
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: AppColors().ButtonColour,
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       Icon(Icons.picture_as_pdf,
                      size: 35,
                      color:AppColors().HeadingColour
                      ),
                      Text(
                        "Pdf",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: AppColors().HeadingColour),
                      ),
                      Text(
                        "Compression",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: AppColors().HeadingColour),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
