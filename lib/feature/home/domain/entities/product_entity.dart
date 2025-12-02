import 'package:shopping_app/feature/home/domain/entities/category_entity.dart';

class ProductEntity {
  int id;
  String title;
  String slug;
  int price;
  String description;
  CategoryEntity category;
  List<String> images;

  ProductEntity({
    this.id = 0,
    this.title = '',
    this.slug = '',
    this.price = 0,
    this.description = '',
    this.category = const CategoryEntity(),
    this.images = const [],
  });
}
