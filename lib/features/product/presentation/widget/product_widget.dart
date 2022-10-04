import 'package:cleanarchitecture/features/product/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
  final ProductModel productModel;

  const ProductWidget({Key? key, required this.productModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Card(
        margin: const EdgeInsets.all(10),
          child: Column(
        children: [
            Image.network(
              productModel.image,
              fit: BoxFit.fitHeight,
              height: 200,
              width: double.infinity,
            ),

          const SizedBox(
            height: 10,
          ),
          Text(
            productModel.title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            productModel.price.toString(),
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.add_shopping_cart_outlined,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
