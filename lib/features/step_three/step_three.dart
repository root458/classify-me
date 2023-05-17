import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:classifyme/features/step_three/cubit/get_course_recommendation_cubit.dart';
import 'package:classifyme/notifiers/_index.dart';
import 'package:classifyme/utils/_index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class StepThreeTrigger extends StatefulWidget {
  const StepThreeTrigger({
    super.key,
    required this.interest,
    required this.subjectPerformance,
  });

  final String interest;
  final Map<String, int> subjectPerformance;

  @override
  State<StepThreeTrigger> createState() => _StepThreeTriggerState();
}

class _StepThreeTriggerState extends State<StepThreeTrigger> {
  @override
  void initState() {
    context
        .read<GetCourseRecommendationCubit>()
        .getCourseRecommendation(widget.subjectPerformance, widget.interest);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCourseRecommendationCubit,
        GetCourseRecommendationState>(
      builder: (context, state) {
        return state.maybeWhen(
          loaded: (courses) => StepThree(
            courses: courses,
          ),
          orElse: () => StepThreeLoading(),
        );
      },
    );
  }
}

class StepThreeLoading extends StatelessWidget {
  const StepThreeLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF412294),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '''Please wait...''',
              style: TextStyle(
                fontFamily: 'InterLight',
                color: Color(0xFFF1EAE0),
                fontSize: 30,
              ),
            ),
            SizedBox(height: 40),
            SizedBox(
              height: 200,
              width: 200,
              child: CircularProgressIndicator(
                color: Color(0xFFF1EAE0),
                strokeWidth: 4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StepThree extends StatelessWidget {
  const StepThree({
    super.key,
    required this.courses,
  });

  final List<String> courses;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final subjectsNotifier = Provider.of<SubjectsNotifier>(context);
    final interestNotifier = Provider.of<InterestNotifier>(context);

    String coursesText = '';
    for (final course in courses) {
      if (courses.indexOf(course) == 0) {
        coursesText += '${courses.indexOf(course) + 1}. $course';
      } else {
        coursesText += '\n${courses.indexOf(course) + 1}. $course';
      }
    }

    return Scaffold(
      backgroundColor: const Color(0xFF412294),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: .03 * height),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: .0984 * width),
            child: SvgPicture.asset(
              'assets/svgs/angle.svg',
              height: .0778 * height,
            ),
          ),
          SizedBox(height: .03 * height),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: .0984 * width),
                child: const Text(
                  '''Well,\nhere we are...''',
                  style: TextStyle(
                    fontFamily: 'InterSemiBold',
                    color: Color(0xFFF1EAE0),
                    fontSize: 50,
                  ),
                ),
              ),
              Container(
                height: .5192 * height,
                width: .642 * width,
                decoration: BoxDecoration(
                  color: const Color(0xFF512ABA),
                  border: Border.all(
                    color: const Color(0xFFF1EAE0),
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: .15 * width),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AnimatedTextKit(
                                animatedTexts: [
                                  TypewriterAnimatedText(
                                    coursesText,
                                    textStyle: const TextStyle(
                                      fontFamily: 'InterSemiBold',
                                      color: Color(0xFFF1EAE0),
                                      fontSize: 30,
                                    ),
                                    speed: const Duration(milliseconds: 200),
                                  ),
                                ],
                                totalRepeatCount: 1,
                                pause: const Duration(microseconds: 1000),
                                displayFullTextOnTap: true,
                                stopPauseOnTap: true,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: SizedBox(
                        height: .2381 * height,
                        child: SvgPicture.asset('assets/svgs/right-bar.svg'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: .06 * height),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: .0984 * width),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '''We think you’ll make a great match!''',
                  style: TextStyle(
                    fontFamily: 'InterLight',
                    color: Color(0xFFF1EAE0),
                    fontSize: 15,
                  ),
                ),
                MaterialButton(
                  color: const Color(0xFFEB8054),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  minWidth: .191 * width,
                  height: .0698 * height,
                  onPressed: () {
                    interestNotifier.setInterest(Interest.none);
                    subjectsNotifier.resetPerformances();
                    Navigator.of(context)
                      ..pop()
                      ..pop()
                      ..pop();
                  },
                  child: const Text(
                    '''Finish''',
                    style: TextStyle(
                      fontFamily: 'InterLight',
                      color: Color(0xFFFFFFFF),
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: .06 * height),
        ],
      ),
    );
  }
}
