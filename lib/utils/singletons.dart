import 'package:classifyme/features/step_three/cubit/get_course_recommendation_cubit.dart';
import 'package:classifyme/services/course_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Singletons {
  static final _courseService = CourseServiceImpl();

  static List<BlocProvider> registerCubits() => [
        BlocProvider<GetCourseRecommendationCubit>(
          create: (context) => GetCourseRecommendationCubit(
            courseService: _courseService,
          ),
        ),
      ];
}
