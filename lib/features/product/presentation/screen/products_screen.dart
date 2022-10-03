import 'package:cleanarchitecture/features/product/presentation/controller/product_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productController=Get.put(ProductController());
    final products=productController.productList;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
        centerTitle: true,

      ),
      body: FutureBuilder(
        future: productController.getAllProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(products[index].title),
                  subtitle: Text(products[index].description),
                );
              },
            );

          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
