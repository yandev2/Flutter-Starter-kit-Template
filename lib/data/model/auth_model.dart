import 'package:flutter_app/domain/entity/auth_entity.dart';

class AuthModel {
  int? id;
  String? name;
  String? email;
  String? avatar;
  String? authToken;
  List<String>? roles;

  AuthModel({this.id, this.name, this.email, this.avatar, this.authToken, this.roles});

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      avatar: json['avatar'],
      authToken: json['auth_token'],
      roles: json['roles'] != null ? List<String>.from(json['roles']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "avatar": avatar,
      "auth_token": authToken,
      "roles": roles,
    };
  }

  factory AuthModel.fromEntity(AuthEntity entity) {
    return AuthModel(
      id: entity.id,
      name: entity.name,
      email: entity.email,
      avatar: entity.avatar,
      authToken: entity.authToken,
      roles: entity.roles,
    );
  }

  AuthEntity toEntity() {
    return AuthEntity(
      id: id,
      name: name,
      email: email,
      avatar: avatar,
      authToken: authToken,
      roles: roles,
    );
  }
}
