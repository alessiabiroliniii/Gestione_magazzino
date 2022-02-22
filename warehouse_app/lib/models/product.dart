import 'package:json_annotation/json_annotation.dart';
import 'package:warehouse_app/models/category.dart';
import 'package:warehouse_app/models/warehouse.dart';

part 'product.g.dart';

class Product {
  Product({
    required this.code,
    required this.title,
    required this.date,
    required this.price,
    required this.quantity,
    required this.category,
    required this.warehouse,
  });

  int code;
  String title;
  int quantity;
  double price;
  DateTime date;
  Category category;
  Warehouse warehouse;
}

@JsonSerializable()
class ProductReadAndUpdateDTO {
  ProductReadAndUpdateDTO({
    required this.code,
    required this.title,
    required this.date,
    required this.price,
    required this.quantity,
    required this.category,
    required this.warehouse,
  });

  @JsonKey(name: "id")
  int code;
  @JsonKey(name: "nome")
  String title;
  @JsonKey(name: "quantita")
  int quantity;
  @JsonKey(name: "prezzo")
  double price;
  @JsonKey(name: "data")
  DateTime date;
  @JsonKey(name: "categoria")
  Category category;
  @JsonKey(name: "magazzino")
  Warehouse warehouse;

  factory ProductReadAndUpdateDTO.fromJson(Map<String, dynamic> json) =>
      _$ProductReadAndUpdateDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ProductReadAndUpdateDTOToJson(this);
}

@JsonSerializable()
class ProductCreateDTO {
  ProductCreateDTO({
    required this.title,
    required this.date,
    required this.price,
    required this.quantity,
    required this.category,
    required this.warehouse,
  });

  @JsonKey(name: "nome")
  String title;
  @JsonKey(name: "quantita")
  int quantity;
  @JsonKey(name: "prezzo")
  double price;
  @JsonKey(name: "data")
  DateTime date;
  @JsonKey(name: "categoria")
  Category category;
  @JsonKey(name: "magazzino")
  Warehouse warehouse;

  factory ProductCreateDTO.fromJson(Map<String, dynamic> json) =>
      _$ProductCreateDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ProductCreateDTOToJson(this);
}
