import 'package:cleanarchitecture/features/product/presentation/controller/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:cleanarchitecture/main.dart';
import 'package:logger/logger.dart';

void main() {
  ProductController productController = ProductController();
  var products = productController.getAllProducts();
  test('should be reversed', () => {
    expect(MyApp().reverseString('hello'), 'olleh')
  });


  test('list of products must  be empty ', () =>{
    expect(productController.productList.length, 0)
  });
  test('Product list must be filled with products', () {
    ProductController productController = ProductController();
    var products = productController.getAllProducts();
    expect(products, isNot(0));
  });

}
