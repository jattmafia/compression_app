import 'package:compressionapp/screens/pdfmaker/controller/pdfcontroller.dart';
import 'package:compressionapp/utils/appcolors/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PdfMakerScreen extends StatelessWidget {
  final controller = Get.put(PdfMakerController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors().BackgroundColour,
        body: GetBuilder<PdfMakerController>(builder: (_) {
          return Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextFormField(
                        controller: controller.pdftextcontroller,
                        style: TextStyle(color: AppColors().TextColour),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            filled: true,
                            hintStyle: TextStyle(
                              color: AppColors().TextColour,
                            ),
                            hintText: "Type in your text",
                            fillColor: AppColors().TabbarColour),
                        maxLines: 5,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 0, left: 20, right: 20, bottom: 20),
                      child: TextFormField(
                        controller: controller.filenamecontroller,
                        style: TextStyle(color: AppColors().TextColour),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            filled: true,
                            hintStyle: TextStyle(
                              color: AppColors().TextColour,
                            ),
                            hintText: "Enter pdf name ",
                            fillColor: AppColors().TabbarColour),
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        if (controller.filenamecontroller.text.isEmpty ||
                            controller.pdftextcontroller.text.isEmpty) {
                          Get.snackbar("Error", "Please Fill All Fields",
                              colorText: AppColors().TextColour);
                        } else {
                          controller.pdfmaker();
                        }
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      height: 50,
                      minWidth: 280,
                      color: AppColors().ButtonColour,
                      child: Text(
                        "Convert To Pdf",
                        style: TextStyle(
                            fontSize: 20,
                            color: AppColors().ButtonTextColour),
                      ),
                    ),
                  ],
                ),
              ),
              controller.working == true
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
