part of classifyme_models;

@freezed
class UserData with _$UserData {
  factory UserData(
    int English,
    int Kiswahili,
    int Mathematics,
    int Physics,
    int Biology,
    int Chemistry,
    String Interest,
  ) = _UserData;

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}
