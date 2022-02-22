import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable()
class Category {
  Category({
    required this.code,
    required this.name,
  });

  int code;
  String name;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}

@JsonSerializable()
class CategoryCreateDTO {
  CategoryCreateDTO({
    required this.name,
  });

  @JsonKey(name: "nome")
  final String name;

  factory CategoryCreateDTO.fromJson(Map<String, dynamic> json) =>
      _$CategoryCreateDTOFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryCreateDTOToJson(this);
}
