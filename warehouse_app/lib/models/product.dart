import 'package:json_annotation/json_annotation.dart';
import 'package:pcto/models/category.dart';
import 'package:pcto/models/warehouse.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  Product({
    required this.code,
    required this.title,
    required this.date,
    required this.descrption,
    required this.price,
    required this.quantity,
    required this.category,
    required this.warehouse,
  });

  final int code;
  final String title;
  final int quantity;
  final double price;
  final DateTime date;
  final String descrption;
  final Category category;
  final Warehouse warehouse;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}

@JsonSerializable()
class ProductDTO {
  ProductDTO({
    required this.title,
    required this.date,
    required this.descrption,
    required this.price,
    required this.quantity,
    required this.category,
    required this.warehouse,
  });

  final String title;
  final int quantity;
  final double price;
  final DateTime date;
  final String descrption;
  final Category category;
  final Warehouse warehouse;

  factory ProductDTO.fromJson(Map<String, dynamic> json) =>
      _$ProductDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDTOToJson(this);
}
