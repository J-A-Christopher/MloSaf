import 'package:equatable/equatable.dart';
import 'package:mlosafi/features/get-all-foods/Data/models/get_all_foods_model.dart';

class GetFoodEntity extends Equatable {
  const GetFoodEntity(
      {this.mongo_id,
      this.foodId,
      this.foodName,
      this.imageUrl,
      this.price,
      this.starRating,
      this.description,
      this.category,
      this.subCategory});
  final String? mongo_id;
  final String? foodId;
  final String? foodName;
  final String? imageUrl;
  final int? price;
  final int? starRating;
  final String? description;
  final CategoryObject? category;
  final SubCategoryObject? subCategory;

  @override
  List<Object?> get props => [
        mongo_id,
        foodId,
        foodName,
        imageUrl,
        price,
        starRating,
        description,
        category,
        subCategory
      ];
}
