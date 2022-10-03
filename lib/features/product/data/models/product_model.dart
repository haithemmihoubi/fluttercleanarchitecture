import 'package:cleanarchitecture/features/product/data/models/rating_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'product_model.g.dart';
@JsonSerializable()
class ProductModel {
  final String id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String imageUrl;

  final Rating rating;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.imageUrl,
    required this.rating,
  });

factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);
Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}


// rate class for the product
