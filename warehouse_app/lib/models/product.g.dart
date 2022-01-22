// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      code: json['code'] as int,
      title: json['title'] as String,
      date: DateTime.parse(json['date'] as String),
      descrption: json['descrption'] as String,
      price: (json['price'] as num).toDouble(),
      quantity: json['quantity'] as int,
      category: Category.fromJson(json['category'] as Map<String, dynamic>),
      warehouse: Warehouse.fromJson(json['warehouse'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'code': instance.code,
      'title': instance.title,
      'quantity': instance.quantity,
      'price': instance.price,
      'date': instance.date.toIso8601String(),
      'descrption': instance.descrption,
      'category': instance.category,
      'warehouse': instance.warehouse,
    };

ProductDTO _$ProductDTOFromJson(Map<String, dynamic> json) => ProductDTO(
      title: json['title'] as String,
      date: DateTime.parse(json['date'] as String),
      descrption: json['descrption'] as String,
      price: (json['price'] as num).toDouble(),
      quantity: json['quantity'] as int,
      category: Category.fromJson(json['category'] as Map<String, dynamic>),
      warehouse: Warehouse.fromJson(json['warehouse'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductDTOToJson(ProductDTO instance) =>
    <String, dynamic>{
      'title': instance.title,
      'quantity': instance.quantity,
      'price': instance.price,
      'date': instance.date.toIso8601String(),
      'descrption': instance.descrption,
      'category': instance.category,
      'warehouse': instance.warehouse,
    };
