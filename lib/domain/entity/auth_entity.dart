import 'package:freezed_annotation/freezed_annotation.dart';
part 'auth_entity.freezed.dart';
part 'auth_entity.g.dart';

@Freezed()
abstract class AuthEntity with _$AuthEntity {
  const factory AuthEntity({
    int? id,
    String? name,
    String? email,
    String? password,
    String? avatar,
    String? authToken,
  }) = _AuthEntity;

  factory AuthEntity.fromJson(Map<String, dynamic> json) => _$AuthEntityFromJson(json);
}
//===> flutter pub run build_runner build