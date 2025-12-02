import 'package:shopping_app/feature/home/domain/entities/category_entity.dart';
import 'package:shopping_app/feature/home/domain/entities/product_entity.dart';

class ProductResponseDTO {
  int? id;
  String? title;
  String? slug;
  int? price;
  String? description;
  Category? category;
  List<String>? images;
  String? creationAt;
  String? updatedAt;

  ProductResponseDTO({
    this.id,
    this.title,
    this.slug,
    this.price,
    this.description,
    this.category,
    this.images,
    this.creationAt,
    this.updatedAt,
  });

  ProductResponseDTO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    price = json['price'];
    description = json['description'];
    category = json['category'] != null
        ? Category.fromJson(json['category'])
        : null;
    images = json['images'].cast<String>();
    creationAt = json['creationAt'];
    updatedAt = json['updatedAt'];
  }
  ProductEntity toEntity() => ProductEntity(
    id: id ?? 0,
    title: title ?? '',
    price: price ?? 0,
    description: description ?? '',
    category: category!.toEntity(),
    images: images ?? [],
    slug: slug ?? '',
  );
}

class Category {
  int? id;
  String? name;
  String? slug;
  String? image;
  String? creationAt;
  String? updatedAt;

  Category({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.creationAt,
    this.updatedAt,
  });

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    creationAt = json['creationAt'];
    updatedAt = json['updatedAt'];
  }
  CategoryEntity toEntity() => CategoryEntity(
    id: id ?? 0,
    image: image ?? '',
    name: name ?? '',
    slug: slug ?? '',
  );
}
