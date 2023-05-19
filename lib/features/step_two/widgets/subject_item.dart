import 'package:classifyme/notifiers/_index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SubjectItem extends StatelessWidget {
  const SubjectItem({
    super.key,
    required this.subject,
    this.end = false,
  });

  final String subject;
  final bool end;

  @override
  Widget build(BuildContext context) {
    // final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;
    final subjectsNotifier = Provider.of<SubjectsNotifier>(context);
    final grades = <String>[
      'A',
      'A-',
      'B+',
      'B',
      'B-',
      'C+',
      'C',
      'C-',
      'D+',
      'D',
      'D-',
      'E'
    ];

    return PopupMenuButton<String>(
      color: Color(0xFF412294),
      elevation: 2,
      position: PopupMenuPosition.under,
      itemBuilder: (context) => [
        for (final grade in grades)
          PopupMenuItem(
            height: 30,
            value: grade,
            child: Text(
              grade,
              style: TextStyle(color: Color(0xFFF1EAE0)),
            ),
          ),
      ],
      onSelected: (grade) {
        subjectsNotifier.setSubjectGrade(subject, grade);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment:
            end ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            subject,
            style: const TextStyle(
              fontFamily: 'InterSemiBold',
              color: Color(0xFF412294),
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            subjectsNotifier.subjects[subject]!,
            style: const TextStyle(
              fontFamily: 'InterSemiBold',
              color: Color(0xFF412294),
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
