// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductReadAndUpdateDTO _$ProductReadAndUpdateDTOFromJson(
        Map<String, dynamic> json) =>
    ProductReadAndUpdateDTO(
      code: json['id'] as int,
      title: json['nome'] as String,
      date: DateTime.parse(json['data'] as String),
      price: (json['prezzo'] as num).toDouble(),
      quantity: json['quantita'] as int,
      category: Category.fromJson(json['categoria'] as Map<String, dynamic>),
      warehouse: Warehouse.fromJson(json['magazzino'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductReadAndUpdateDTOToJson(
        ProductReadAndUpdateDTO instance) =>
    <String, dynamic>{
      'id': instance.code,
      'nome': instance.title,
      'quantita': instance.quantity,
      'prezzo': instance.price,
      'data': instance.date.toIso8601String(),
      'categoria': instance.category,
      'magazzino': instance.warehouse,
    };

ProductCreateDTO _$ProductCreateDTOFromJson(Map<String, dynamic> json) =>
    ProductCreateDTO(
      title: json['nome'] as String,
      date: DateTime.parse(json['data'] as String),
      price: (json['prezzo'] as num).toDouble(),
      quantity: json['quantita'] as int,
      category: Category.fromJson(json['categoria'] as Map<String, dynamic>),
      warehouse: Warehouse.fromJson(json['magazzino'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductCreateDTOToJson(ProductCreateDTO instance) =>
    <String, dynamic>{
      'nome': instance.title,
      'quantita': instance.quantity,
      'prezzo': instance.price,
      'data': instance.date.toIso8601String(),
      'categoria': instance.category,
      'magazzino': instance.warehouse,
    };
