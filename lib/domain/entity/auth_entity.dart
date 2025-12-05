import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_entity.freezed.dart';
part 'auth_entity.g.dart';

@Freezed()
abstract class AuthEntity with _$AuthEntity {
  const factory AuthEntity({
    int? id,
    String? name,
    String? email,
    String? avatar,
    String? authToken,
    List<String>? roles,
  }) = _AuthEntity;

  factory AuthEntity.fromJson(Map<String, dynamic> json) => _$AuthEntityFromJson(json);
}

//===> run flutter pub run build_runner build
