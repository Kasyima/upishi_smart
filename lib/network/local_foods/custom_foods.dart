import 'package:json_annotation/json_annotation.dart';
part 'custom_foods.g.dart';

@JsonSerializable()
class CustomFood {
  final String title;
  final String description;
  final int totalTime;
  final String imageUrl;

  // DocumentReference? reference;

  CustomFood({
    required this.title,
    required this.description,
    required this.totalTime,
    required this.imageUrl,
    // this.reference,
  });

  factory CustomFood.fromJson(Map<String, dynamic> json) =>
      _$CustomFoodFromJson(json);

  Map<String, dynamic> toJson() => _$CustomFoodToJson(this);
  // Map<String, dynamic> toJson() => _$APIRecipeQueryToJson(this);

  String getTime(double? calories) {
    if (totalTime == null) {
      return '0 MINUTES';
    }
    return '${totalTime.floor()} minutes';
  }

  // factory CustomFood.fromSnapshot(DocumentSnapshot snapshot) {
  //   final customfood =
  //       CustomFood.fromJson(snapshot.data() as Map<String, dynamic>);
  //   customfood.reference = snapshot.reference;
  //   return customfood;
  // }
}
