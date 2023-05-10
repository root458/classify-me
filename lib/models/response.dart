part of classifyme_models;

@freezed
class Recommendations with _$Recommendations {
  factory Recommendations({
    @Default(<String>['Clinical Medicine', 'Dental Surgery', 'Pharmacy'])
        List<String> recommended_courses,
  }) = _Recommendations;

  factory Recommendations.fromJson(Map<String, dynamic> json) =>
      _$RecommendationsFromJson(json);
}
