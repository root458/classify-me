part of classifyme_models;

@freezed
class ClassifyMeValidationError with _$ClassifyMeValidationError {
  factory ClassifyMeValidationError(
    int code,
    List<ClassifyMeFieldValidationError> errors,
  ) = _ClassifyMeValidationError;

  factory ClassifyMeValidationError.fromJson(Map<String, dynamic> json) =>
      _$ClassifyMeValidationErrorFromJson(json);
}

@freezed
class ClassifyMeFieldValidationError with _$ClassifyMeFieldValidationError {
  factory ClassifyMeFieldValidationError(
    String key,
    List<String> errors,
  ) = _ClassifyMeFieldValidationError;

  factory ClassifyMeFieldValidationError.fromJson(Map<String, dynamic> json) =>
      _$ClassifyMeFieldValidationErrorFromJson(json);
}

class Failure implements Exception {
  Failure({
    required this.message,
    this.errors = const [],
  });

  final String message;
  List<ClassifyMeFieldValidationError> errors;

  List<String> errorMessages() {
    final _errors = <String>[];

    for (final _error in errors) {
      _errors.add(
        _error.errors[0],
      );
    }

    return List.castFrom<dynamic, String>(_errors);
  }
}
