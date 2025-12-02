import 'package:shopping_app/feature/home/domain/entities/category_entity.dart';

class CategoryResponseDTO {
  int? id;
  String? name;
  String? slug;
  String? image;
  String? creationAt;
  String? updatedAt;

  CategoryResponseDTO({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.creationAt,
    this.updatedAt,
  });

  CategoryResponseDTO.fromJson(Map<String, dynamic> json) {
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
