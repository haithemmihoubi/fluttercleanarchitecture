
import 'package:cleanarchitecture/features/product/presentation/controller/product_controller.dart';
import 'package:cleanarchitecture/features/product/presentation/screen/products_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:cleanarchitecture/main.dart';
import 'package:get/get.dart';
import 'package:get_test/get_test.dart';
import 'package:logger/logger.dart';

void main() {
  ProductController productController = ProductController();
  var products = productController.getAllProducts();
  test('should be reversed', () => {
    expect(MyApp().reverseString('hello'), 'olleh')
  });

// test the list of products must be empty when it intialized
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


// test widget function
// testing getx controller
  testWidgets('testing getx controller ad pproduct list must be filled with product model',
          (WidgetTester tester) async {
   
  });




}