import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
class ImageController extends GetxController {

final ImagePicker _picker = ImagePicker();
List<XFile> images = [];
List<String> LstImagePath = [];
var selectedFileCount=0.obs;

@override
  void onInit() {
//
  }

@override
  void onReady() {
//
  }

@override
  void onClose() {
//
  }
// select one image and store in list
  void SelectImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      images.add(pickedFile);
      LstImagePath.add(pickedFile.path);
      selectedFileCount.value = images.length;
    } else {
      print('No image selected.');
    }
  }

  // pick multiple images
  void PickMultipleImages() async {
    final images = await _picker.pickMultiImage();
    if (images != null) {
      // store the imlages in list
      images.addAll(images);
      LstImagePath.addAll(images.map((e) => e.path).toList());
      selectedFileCount.value = images.length;
    } else {
      Get.snackbar('Sorry','Select some images to upload',snackPosition: SnackPosition.TOP,backgroundColor: Colors.red);
    }
  }



}