// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthEntity _$AuthEntityFromJson(Map<String, dynamic> json) => _AuthEntity(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  email: json['email'] as String?,
  password: json['password'] as String?,
  avatar: json['avatar'] as String?,
  authToken: json['authToken'] as String?,
);

Map<String, dynamic> _$AuthEntityToJson(_AuthEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'avatar': instance.avatar,
      'authToken': instance.authToken,
    };
