import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
class UserModel with _$UserModel {
  const UserModel._();

  factory UserModel({
    required int id,
    required String name,
    required DateTime birthday,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
