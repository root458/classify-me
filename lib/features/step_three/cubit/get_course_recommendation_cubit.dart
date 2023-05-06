import 'dart:io';

import 'package:bloc/bloc.dart';
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

  Future<void> getCourseRecommendation() async {
    emit(const GetCourseRecommendationState.loading());
    try {
      // ignore: unused_local_variable
      final _result = await _courseService.getCourseRecommendations();

      emit(GetCourseRecommendationState.loaded());
    } on SocketException {
      emit(GetCourseRecommendationState.error('Check network connection!'));
    } catch (e) {
      emit(GetCourseRecommendationState.error('Retrieving courses failed'));
    }
  }
}
