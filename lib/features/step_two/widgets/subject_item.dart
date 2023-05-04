import 'package:flutter/material.dart';

class SubjectItem extends StatelessWidget {
  const SubjectItem({
    super.key,
    required this.subject,
    required this.grade,
    this.end = false,
  });

  final String subject;
  final String grade;
  final bool end;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment:
          end ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Text(
          subject,
          style: const TextStyle(
            fontFamily: 'InterSemiBold',
            color: Color(0xFFFFFFFF),
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          grade,
          style: const TextStyle(
            fontFamily: 'InterSemiBold',
            color: Color(0xFFFFFFFF),
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
