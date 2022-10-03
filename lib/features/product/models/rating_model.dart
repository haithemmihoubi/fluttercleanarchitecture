import 'package:json_annotation/json_annotation.dart';
part 'rating_model.g.dart';
@JsonSerializable()
class Rating {
  @JsonKey(defaultValue: 0)
  final double rate;
  @JsonKey(defaultValue: 0)
  final int count;

  Rating({required this.rate, required this.count});
  factory Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);
  Map<String, dynamic> toJson() => _$RatingToJson(this);
}
