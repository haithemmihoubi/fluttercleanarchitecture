
import 'package:cleanarchitecture/features/product/presentation/controller/product_controller.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([Dio])
void main() {
 group("all the product test must be done", () {
    test("product list must be filled with product model", () {
      ProductController productController = ProductController();
      var products = productController.getAllProducts();
      expect(products, isNot(0));
    }); test("categories list must be filled with categories model", () {
      ProductController productController = ProductController();
      var categories = productController.getAllCategories();
      expect(categories, isNot(0));
    });
  });
}