import 'package:equatable/equatable.dart';
import 'package:mlosafi/features/get-all-foods/Domain/entities/get-food-entity.dart';

class GetAllFoodsModel extends GetFoodEntity with EquatableMixin {
  GetAllFoodsModel(
      {this.mongo_id,
      this.foodId,
      this.foodName,
      this.imageUrl,
      this.price,
      this.starRating,
      this.description,
      this.category,
      this.subCategory});
  @override
  final String? mongo_id;
  @override
  final String? foodId;
  @override
  final String? foodName;
  @override
  final String? imageUrl;
  @override
  final int? price;
  @override
  final int? starRating;
  @override
  final String? description;
  @override
  final String? category;
  @override
  final String? subCategory;

  factory GetAllFoodsModel.fromJson(Map<String, dynamic> data) {
    return GetAllFoodsModel(
        mongo_id: data['_id'],
        foodId: data['foodId'],
        foodName: data['name'],
        imageUrl: data['imageUrl'],
        price: data['price'],
        starRating: data['starRating'],
        description: data['description'],
        category: data['category'],
        subCategory: data['subCategory']);
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': mongo_id,
      'foodId': foodId,
      'name': foodName,
      'imageUrl': imageUrl,
      'price': price,
      'starRating': starRating,
      'description': description,
      'category': category,
      'subCategory': subCategory
    };
  }
}
