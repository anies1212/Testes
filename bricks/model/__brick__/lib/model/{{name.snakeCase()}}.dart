import 'package:freezed_annotation/freezed_annotation.dart';

part '{{name.snakeCase()}}.freezed.dart';

@freezed
class {{name.pascalCase()}}Model with _${{name.pascalCase()}}Model {
  const {{name.pascalCase()}}Model._();

  factory {{name.pascalCase()}}Model({
    required String placeHolder,
  }) = _{{name.pascalCase()}}Model;

  factory {{name.pascalCase()}}Model.fromJson(Map<String, dynamic> json) =>
      _${{name.pascalCase()}}ModelFromJson(json);

  factory {{name.pascalCase()}}Model.fromJson(Map<String, dynamic> json) =>
      _${{name.pascalCase()}}ModelFromJson(json);

  @visibleForTesting
  static const defaultInstance = {{name.pascalCase()}}Model(
    placeHolder: '',
  );
}
