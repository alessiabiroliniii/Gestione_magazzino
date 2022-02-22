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

UserRegisterDTO _$UserRegisterDTOFromJson(Map<String, dynamic> json) =>
    UserRegisterDTO(
      name: json['nome'] as String,
      surname: json['cognome'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$UserRegisterDTOToJson(UserRegisterDTO instance) =>
    <String, dynamic>{
      'nome': instance.name,
      'cognome': instance.surname,
      'email': instance.email,
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
