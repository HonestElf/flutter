import 'package:hive/hive.dart';

part 'hive_item.g.dart';

@HiveType(typeId: 0)
class CategoryItem extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String description;

  CategoryItem({required this.name, required this.description});
}

@HiveType(typeId: 1)
class HiveCategory extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  List<CategoryItem> items;

  HiveCategory({required this.name, this.items = const []});
}
