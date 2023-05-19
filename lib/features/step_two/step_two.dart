import 'package:classifyme/features/step_three/step_three.dart';
import 'package:classifyme/features/step_two/widgets/subject_item.dart';
import 'package:classifyme/notifiers/_index.dart';
import 'package:classifyme/utils/misc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class Subject {
  const Subject({required this.subject, required this.grade});
  final String subject;
  final String grade;
}

class StepTwo extends StatelessWidget {
  const StepTwo({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final subjectsNotifier = Provider.of<SubjectsNotifier>(context);
    final interestNotifier = Provider.of<InterestNotifier>(context);

    final subjects = <String>[
      'Mathematics',
      'Physics',
      'English',
      'Biology',
      'Kiswahili',
      'Chemistry',
    ];

    // Purple: Color(0xFF412294)
    // Cream: Color(0xFFF1EAE0)
    return Scaffold(
      backgroundColor: const Color(0xFFF1EAE0),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: .0984 * width),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: .03 * height),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '''Help us help you!''',
                  style: TextStyle(
                    fontFamily: 'InterSemiBold',
                    color: Color(0xFF412294),
                    fontSize: 50,
                  ),
                ),
                SvgPicture.asset(
                  'assets/svgs/angle.svg',
                  height: .0778 * height,
                ),
              ],
            ),
            SizedBox(height: .03 * height),
            const Text(
              '''Tell us about your grades''',
              style: TextStyle(
                fontFamily: 'InterLight',
                color: Color(0xFF412294),
                fontSize: 20,
              ),
            ),
            SizedBox(height: .015 * height),
            SizedBox(height: .0698 * height),
            const Text(
              '''Tap to update!''',
              style: TextStyle(
                fontFamily: 'InterLight',
                color: Color(0xFF412294),
                fontSize: 15,
              ),
            ),
            SizedBox(height: .06 * height),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: .347 * height,
                  width: .44 * width,
                  child: GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: 3.3,
                    mainAxisSpacing: 5,
                    children: [
                      for (final subject in subjects)
                        SubjectItem(
                          subject: subject,
                        ),
                    ],
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Overall Grade',
                      style: const TextStyle(
                        fontFamily: 'InterSemiBold',
                        color: Color(0xFF412294),
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Color(0xFFF1EAE0),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: TextEditingController()..addListener(() {}),
                        cursorColor: Color(0xFFEB8054),
                        decoration: InputDecoration(
                          fillColor: Color(0xFFF1EAE0),
                          hintText: 'Overall grade',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: Color(0xFFEB8054),
                              width: 0.5,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: Color(0xFFEB8054),
                              width: 1.5,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: .06 * height),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MaterialButton(
                  color: const Color(0xFFEB8054),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  minWidth: .191 * width,
                  height: .0698 * height,
                  onPressed: subjectsNotifier.goodToGo
                      ? () => Navigator.of(context).push(
                            MaterialPageRoute<void>(
                              builder: (context) => StepThreeTrigger(
                                interest:
                                    Misc.getInterest(interestNotifier.interest),
                                subjectPerformance:
                                    subjectsNotifier.getSubjectPerformance(),
                              ),
                            ),
                          )
                      : null,
                  child: const Text(
                    '''Next''',
                    style: TextStyle(
                      fontFamily: 'InterLight',
                      color: Color(0xFFFFFFFF),
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: .06 * height),
          ],
        ),
      ),
    );
  }
}
