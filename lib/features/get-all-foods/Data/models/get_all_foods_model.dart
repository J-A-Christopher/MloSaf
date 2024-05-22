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
  final CategoryObject? category;
  @override
  final SubCategoryObject? subCategory;

  factory GetAllFoodsModel.fromJson(Map<String, dynamic> data) {
    return GetAllFoodsModel(
        mongo_id: data['_id'],
        foodId: data['foodId'],
        foodName: data['name'],
        imageUrl: data['imageUrl'],
        price: data['price'],
        starRating: data['starRating'],
        description: data['description'],
        category: CategoryObject.fromJson(data['category']),
        subCategory: SubCategoryObject.fromJson(data['subCategory']));
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

class CategoryObject {
  CategoryObject(
      {this.categoryId, this.foodId, this.mongo_id, this.size, this.name});
  final String? mongo_id;
  final String? categoryId;
  final String? foodId;
  final String? size;
  final String? name;

  factory CategoryObject.fromJson(Map<String, dynamic> data) {
    return CategoryObject(
        name: data['name'],
        categoryId: data['categoryId'],
        foodId: data['foodId'],
        mongo_id: data['_id'],
        size: data['size']);
  }
}

class SubCategoryObject {
  SubCategoryObject(
      {this.subCategoryId, this.categoryId, this.mongo_id, this.size});
  final String? mongo_id;
  final String? subCategoryId;
  final String? categoryId;
  final String? size;

  factory SubCategoryObject.fromJson(Map<String, dynamic> data) {
    return SubCategoryObject(
        subCategoryId: data['subCategoryId'],
        categoryId: data['categoryId'],
        mongo_id: data['_id'],
        size: data['size']);
  }
}
