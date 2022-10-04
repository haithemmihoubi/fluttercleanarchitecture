import 'package:cleanarchitecture/features/product/presentation/controller/product_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../widget/product_widget.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {




  @override
  Widget build(BuildContext context) {
    final productController=Get.put(ProductController());
Logger logger=Logger();
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
              itemCount: productController.productList.length,

              itemBuilder: (context, index) {
                return ProductWidget(productModel: productController.productList[index],);
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
// you can initilaize to true
