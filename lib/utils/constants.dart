class ClassifyMeValues {
  ClassifyMeValues({
    required this.baseDomain,
  });

  final String baseDomain;
}

class ClassifyMeConfig {
  factory ClassifyMeConfig({required ClassifyMeValues values}) {
    return _instance ??= ClassifyMeConfig._internal(values);
  }

  ClassifyMeConfig._internal(this.values);

  final ClassifyMeValues values;
  static ClassifyMeConfig? _instance;

  static ClassifyMeConfig? get instance => _instance;
}
