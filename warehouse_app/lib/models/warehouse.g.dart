// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'warehouse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Warehouse _$WarehouseFromJson(Map<String, dynamic> json) => Warehouse(
      id: json['id'] as int,
      name: json['nome'] as String,
      address: json['indirizzo'] as String,
    );

Map<String, dynamic> _$WarehouseToJson(Warehouse instance) => <String, dynamic>{
      'id': instance.id,
      'nome': instance.name,
      'indirizzo': instance.address,
    };

WarehouseCreateDTO _$WarehouseCreateDTOFromJson(Map<String, dynamic> json) =>
    WarehouseCreateDTO(
      name: json['nome'] as String,
      address: json['indirizzo'] as String,
    );

Map<String, dynamic> _$WarehouseCreateDTOToJson(WarehouseCreateDTO instance) =>
    <String, dynamic>{
      'nome': instance.name,
      'indirizzo': instance.address,
    };
