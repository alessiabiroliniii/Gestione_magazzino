import 'package:json_annotation/json_annotation.dart';

part 'warehouse.g.dart';

@JsonSerializable()
class Warehouse {
  Warehouse({
    required this.id,
    required this.name,
    required this.address,
  });

  int id;
  @JsonKey(name: "nome")
  String name;

  @JsonKey(name: "indirizzo")
  String address;

  factory Warehouse.fromJson(Map<String, dynamic> json) =>
      _$WarehouseFromJson(json);

  Map<String, dynamic> toJson() => _$WarehouseToJson(this);
}

@JsonSerializable()
class WarehouseCreateDTO {
  WarehouseCreateDTO({
    required this.name,
    required this.address,
  });

  @JsonKey(name: "nome")
  final String name;
  @JsonKey(name: "indirizzo")
  final String address;

  factory WarehouseCreateDTO.fromJson(Map<String, dynamic> json) =>
      _$WarehouseCreateDTOFromJson(json);

  Map<String, dynamic> toJson() => _$WarehouseCreateDTOToJson(this);
}
