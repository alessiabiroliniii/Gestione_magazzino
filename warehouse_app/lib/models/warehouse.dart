import 'package:json_annotation/json_annotation.dart';

part 'warehouse.g.dart';

@JsonSerializable()
class Warehouse {
  Warehouse({
    required this.code,
    required this.name,
    required this.address,
    required this.phone,
  });

  final int code;
  final String name;
  final int phone;
  final String address;

  factory Warehouse.fromJson(Map<String, dynamic> json) =>
      _$WarehouseFromJson(json);

  Map<String, dynamic> toJson() => _$WarehouseToJson(this);
}

@JsonSerializable()
class WarehouseDTO {
  WarehouseDTO({
    required this.name,
    required this.address,
    required this.phone,
  });

  final String name;
  final int phone;
  final String address;

  factory WarehouseDTO.fromJson(Map<String, dynamic> json) =>
      _$WarehouseDTOFromJson(json);

  Map<String, dynamic> toJson() => _$WarehouseDTOToJson(this);
}
