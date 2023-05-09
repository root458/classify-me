part of classifyme_utils;

class Singletons {
  static final _courseService = CourseServiceImpl();

  static List<BlocProvider> registerCubits() => [
        BlocProvider<GetCourseRecommendationCubit>(
          create: (context) => GetCourseRecommendationCubit(
            courseService: _courseService,
          ),
        ),
      ];

  static List<ChangeNotifierProvider> registerNotifiers() => [
        ChangeNotifierProvider<InterestNotifier>(
          create: (context) => InterestNotifier(),
        ),
        ChangeNotifierProvider<SubjectsNotifier>(
          create: (context) => SubjectsNotifier(),
        ),
      ];
}
