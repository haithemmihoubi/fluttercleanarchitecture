
import 'dart:io';

import 'package:cleanarchitecture/networking/dio_client.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart' ;
class ImageController extends GetxController {

final ImagePicker _picker = ImagePicker();
List<XFile> images = [];
List<String> ListImagePath = [];
var selectedFileCount=0.obs;
 DioClient _dioClient = DioClient();
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
      ListImagePath.add(pickedFile.path);
      selectedFileCount.value = images.length;
    } else {
      print('No image selected.');
    }
  }

  // pick multiple images
  void PickMultipleImages() async {
  // pick multiple images
    final images = await _picker.pickMultiImage();
    if (images != null) {
      // store the images in list
      images.addAll(images);
      // store the images path in list
      ListImagePath.addAll(images.map((e) => e.path).toList());
      // update the selected file count to count the selected images
      selectedFileCount.value = images.length;
    } else {
      Get.snackbar('Sorry','Select some images to upload',snackPosition: SnackPosition.TOP,backgroundColor: Colors.red);
    }
  }


  Future<void> RemoveImage(int index) async {
    images.removeAt(index);
    ListImagePath.removeAt(index);
    selectedFileCount.value = images.length;
  }



  // upload images to  api
  Future<void> UploadImages() async {
   try {
     // upload images to api
     final formData = FormData({});
      // add images to form data
      for ( String path in ListImagePath) {
        formData.files.add(MapEntry("file[]",MultipartFile(File(path), filename: path.split('/').last)));
      }
      // send request to api
      final response = await DioClient.dio.post('http://localhost:8000/api/upload', data: formData);
      // check if response is success
         if(response.statusCode ==200) {
           Get.snackbar('Success', 'Images uploaded successfully',snackPosition: SnackPosition.TOP,backgroundColor: Colors.green);
         } else {
           Get.snackbar('Sorry', 'Something went wrong',snackPosition: SnackPosition.TOP,backgroundColor: Colors.red);
           return Future.error('Something went wrong  ${response.statusCode} body ${response.data}');
         }
   } catch (e) {
     print(e);
   }
  }
// upload image
void uploadImage() async {
  if (selectedFileCount.value > 0) {
    // upload images to api
    Get.dialog(const Center(child: CircularProgressIndicator()),
        barrierDismissible: false);
    await UploadImages().then((resp) {
      Get.back();
      Get.snackbar('Success', 'Images uploaded successfully',snackPosition: SnackPosition.TOP,backgroundColor: Colors.green);
      images.clear();
      ListImagePath.clear();
      selectedFileCount.value = 0;
    }).catchError((e) {
      Get.back();
      Get.snackbar('Sorry', 'Something went wrong',snackPosition: SnackPosition.TOP,backgroundColor: Colors.red);
    });
    Get.back();


  } else {
    Get.snackbar('Sorry', 'Select some images to upload',
        snackPosition: SnackPosition.TOP, backgroundColor: Colors.red);
  }
}




}