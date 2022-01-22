// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      code: json['code'] as int,
      name: json['name'] as String,
      surname: json['surname'] as String,
      email: json['email'] as String,
      role: $enumDecode(_$UserRoleEnumMap, json['role']),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'surname': instance.surname,
      'email': instance.email,
      'role': _$UserRoleEnumMap[instance.role],
    };

const _$UserRoleEnumMap = {
  UserRole.admin: 'admin',
  UserRole.user: 'user',
};

UserDTO _$UserDTOFromJson(Map<String, dynamic> json) => UserDTO(
      name: json['name'] as String,
      surname: json['surname'] as String,
      email: json['email'] as String,
      role: $enumDecode(_$UserRoleEnumMap, json['role']),
      password: json['password'] as String,
    );

Map<String, dynamic> _$UserDTOToJson(UserDTO instance) => <String, dynamic>{
      'name': instance.name,
      'surname': instance.surname,
      'email': instance.email,
      'role': _$UserRoleEnumMap[instance.role],
      'password': instance.password,
    };

UserLoginDTO _$UserLoginDTOFromJson(Map<String, dynamic> json) => UserLoginDTO(
      password: json['password'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$UserLoginDTOToJson(UserLoginDTO instance) =>
    <String, dynamic>{
      'password': instance.password,
      'email': instance.email,
    };
