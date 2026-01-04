import '../../domain/entity/auth_entity.dart';

class AuthModel {
  int? id;
  String? username;
  String? email;
  String? password;
  String? avatar;
  String? authToken;

  AuthModel({this.id, this.username, this.email, this.password, this.avatar, this.authToken});

  /// JSON → Model
  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      id: json['id'] as int?,
      username: json['username'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      avatar: json['avatar'] as String?,
      authToken: json['auth_token'] as String?,
    );
  }

  /// Model → JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'password': password,
      'avatar': avatar,
      'auth_token': authToken,
    };
  }

  /// Entity → Model
  factory AuthModel.fromEntity(AuthEntity entity) {
    return AuthModel(
      id: entity.id,
      username: entity.name,
      email: entity.email,
      password: entity.password,
      avatar: entity.avatar,
      authToken: entity.authToken,
    );
  }

  /// Model → Entity
  AuthEntity toEntity() {
    return AuthEntity(
      id: id,
      name: username,
      email: email,
      password: password,
      avatar: avatar,
      authToken: authToken,
    );
  }
}
