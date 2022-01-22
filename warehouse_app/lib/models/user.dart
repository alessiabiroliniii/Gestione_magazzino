import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

enum UserRole {
  admin,
  user,
}

@JsonSerializable()
class User {
  User({
    required this.code,
    required this.name,
    required this.surname,
    required this.email,
    required this.role,
  });

  final int code;
  final String name;
  final String surname;
  final String email;
  final UserRole role;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class UserDTO {
  UserDTO({
    required this.name,
    required this.surname,
    required this.email,
    required this.role,
    required this.password,
  });

  final String name;
  final String surname;
  final String email;
  final UserRole role;
  final String password;

  factory UserDTO.fromJson(Map<String, dynamic> json) =>
      _$UserDTOFromJson(json);

  Map<String, dynamic> toJson() => _$UserDTOToJson(this);
}

@JsonSerializable()
class UserLoginDTO {
  UserLoginDTO({
    required this.password,
    required this.email,
  });

  final String password;
  final String email;

  factory UserLoginDTO.fromJson(Map<String, dynamic> json) =>
      _$UserLoginDTOFromJson(json);

  Map<String, dynamic> toJson() => _$UserLoginDTOToJson(this);
}
