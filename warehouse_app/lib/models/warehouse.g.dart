// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'warehouse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Warehouse _$WarehouseFromJson(Map<String, dynamic> json) => Warehouse(
      code: json['code'] as int,
      name: json['name'] as String,
      address: json['address'] as String,
      phone: json['phone'] as int,
    );

Map<String, dynamic> _$WarehouseToJson(Warehouse instance) => <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'phone': instance.phone,
      'address': instance.address,
    };

WarehouseDTO _$WarehouseDTOFromJson(Map<String, dynamic> json) => WarehouseDTO(
      name: json['name'] as String,
      address: json['address'] as String,
      phone: json['phone'] as int,
    );

Map<String, dynamic> _$WarehouseDTOToJson(WarehouseDTO instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phone': instance.phone,
      'address': instance.address,
    };
