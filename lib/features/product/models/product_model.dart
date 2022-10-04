import 'package:cleanarchitecture/features/product/models/rating_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'product_model.g.dart';
@JsonSerializable()
class ProductModel {
  @JsonKey(defaultValue: 0)
  final int id;
  @JsonKey(defaultValue: '')
  final String title;
  @JsonKey(defaultValue: 0)
  final double price;
  @JsonKey(defaultValue: '')
  final String description;
  @JsonKey(defaultValue: '')
  final String category;
  final String image;
  final Rating rating;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);
Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}


// rate class for the product
