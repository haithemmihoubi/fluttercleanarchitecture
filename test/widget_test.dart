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

// test thg elist opf products must be empty when it ssis sinitialiozed
  test('list of products must  be empty ', () =>{
    expect(productController.productList.length, 0)
  });
  // testing the product  list
    test('Product list must be filled with products', () {
    ProductController productController = ProductController();
    var products = productController.getAllProducts();
    expect(products, isNot(0));
  });
//  testing getting the gettting the categories
  test('categories list must be filled with  all the categories', () {
    ProductController productController = ProductController();
    var products = productController.getAllCategories();
    expect(products, isNot(0));
  });





}
