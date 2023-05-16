import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:classifyme/models/_index.dart';
import 'package:classifyme/services/course_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_course_recommendation_state.dart';
part 'get_course_recommendation_cubit.freezed.dart';

class GetCourseRecommendationCubit extends Cubit<GetCourseRecommendationState> {
  GetCourseRecommendationCubit({
    required CourseService courseService,
  }) : super(GetCourseRecommendationState.initial()) {
    _courseService = courseService;
  }

  late CourseService _courseService;

  Future<void> getCourseRecommendation(
    Map<String, int> subjectPerformance,
    String interest,
  ) async {
    emit(const GetCourseRecommendationState.loading());
    try {
      final _result = await _courseService.getCourseRecommendations(
        UserData(
          subjectPerformance['English']!,
          subjectPerformance['Kiswahili']!,
          subjectPerformance['Mathematics']!,
          subjectPerformance['Physics']!,
          subjectPerformance['Biology']!,
          subjectPerformance['Chemistry']!,
          interest,
        ),
      );

      emit(GetCourseRecommendationState.loaded(_result.recommended_courses));
    } on SocketException {
      emit(GetCourseRecommendationState.error('Check network connection!'));
    } catch (e) {
      print(e.toString());
      emit(GetCourseRecommendationState.error('Retrieving courses failed'));
    }
  }
}
