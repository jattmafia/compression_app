import 'dart:io';
import 'dart:typed_data';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_compress/video_compress.dart';

import '../../../../utils/appcolors/appcolors.dart';

class VideoCompressionController extends GetxController {
  bool compressing = false;
  File? videoFile;
  Uint8List? thumbnail;
  @override
  void onClose() async {
    await VideoCompress.cancelCompression();
    await VideoCompress.deleteAllCache();
    //THIS IS NEVER HIT
    super.onClose();
  }

  pickvideo() async {
    final videopicker = ImagePicker();
    final pickedVideo = await videopicker.getVideo(source: ImageSource.gallery);

    if (pickedVideo == null) return;
    videoFile = File(pickedVideo.path);
    thumbnail = await VideoCompress.getByteThumbnail(videoFile!.path);
    update();
  }

  compressvideo() async {
    compressing = true;
    update();
    final Directory triofolder = Directory('/storage/emulated/0/Download/Trio');
    final Directory imagesfolder =
        Directory('/storage/emulated/0/Download/Trio/Compressedvideos');

    if (!await triofolder.exists()) {
      await triofolder.create(recursive: true);
    }

    if (!await imagesfolder.exists()) {
      await imagesfolder.create(recursive: true);
    }
    await VideoCompress.compressVideo(videoFile!.path,
        quality: VideoQuality.MediumQuality, includeAudio: true);
    await VideoCompress.deleteAllCache();
    compressing = false;
    update();
    Get.snackbar(
        "Success", "Video Saved To Downloads/Trio/CompressedVideos Folder",
        colorText: AppColors().TextColour);
  }
}
