part of 'get_course_recommendation_cubit.dart';

@freezed
class GetCourseRecommendationState with _$GetCourseRecommendationState {
  const factory GetCourseRecommendationState.initial() = _Initial;
  const factory GetCourseRecommendationState.loading() = _Loading;
  const factory GetCourseRecommendationState.loaded(List<String> courses) = _Loaded;
  const factory GetCourseRecommendationState.error(String error) = _Error;
}
