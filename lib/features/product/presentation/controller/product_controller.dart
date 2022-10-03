import 'package:cleanarchitecture/core/utils/constants/constants.dart';
import 'package:cleanarchitecture/networking/dio_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../models/product_model.dart';

class ProductController extends GetxController {
  final productList = <ProductModel>[].obs;
  DioClient dioClient = DioClient();
  // intialize the logger
  final logger = Logger();
  // get all the products
  Future<List> getAllProducts() async {
    try {
      final response = await DioClient.dio.get(
          "${AppConstants.baseUrl}/products");
       productList.assignAll(
           await response.data.map<ProductModel>((e) => ProductModel.fromJson(e))
              .toList());
      logger.i(productList);

    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        debugPrint('Dio error!');
        debugPrint('STATUS  OF THE RESPONSE: ${e.response?.statusCode}');
        debugPrint('DATA IN THE RESPONSE : ${e.response?.data}');
        debugPrint('HEADERS OF THE RESPONSE : ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        debugPrint('!!!!!!!!!!! Error sending request!');
        debugPrint(e.message);
      }
    }
    return productList;
  }

    @override
    void onInit() {
    productList.value = [];
      super.onInit();
    }

    @override
    void onReady() {
      getAllProducts();
      super.onReady();
    }

    @override
    void onClose() {

      super.onClose();
    }
  }