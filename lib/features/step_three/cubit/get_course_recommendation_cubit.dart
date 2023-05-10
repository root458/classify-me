import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:classifyme/models/_index.dart';
import 'package:classifyme/services/course_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    emit(const GetCourseRecommendationState.loading());
    try {
      final QuerySnapshot querySnapshot =
          await firestore.collection('courses').get();
      final QueryDocumentSnapshot doc = querySnapshot.docs.first;
      List<dynamic> courses = doc.get(interest) as List<dynamic>;

      List<String> recommendedCourses = courses.cast<String>();

      // ignore: unused_local_variable
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

      emit(GetCourseRecommendationState.loaded(recommendedCourses));
    } on SocketException {
      emit(GetCourseRecommendationState.error('Check network connection!'));
    } catch (e) {
      print(e.toString());
      emit(GetCourseRecommendationState.error('Retrieving courses failed'));
    }
  }
}
