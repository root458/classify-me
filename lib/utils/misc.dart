import 'package:classifyme/utils/_index.dart';

class Misc {
  static final points = <String, int>{
    'A': 12,
    'A-': 11,
    'B+': 10,
    'B': 9,
    'B-': 8,
    'C+': 7,
    'C': 6,
    'C-': 5,
    'D+': 4,
    'D': 3,
    'D-': 2,
    'E': 1,
    '_': 0,
  };
  static int getPoints(String grade) {
    return points[grade]!;
  }

  static String getInterest(Interest interest) {
    switch (interest) {
      case Interest.laboratories:
        return 'Laboratories';
      case Interest.none:
        return '';
      case Interest.nursing:
        return 'Nursing';
      case Interest.pharmacy:
        return 'Pharmacy';
      case Interest.physiotherapy:
        return 'Physiotherapy';
      case Interest.surgery:
        return 'Surgery';
    }
  }
}
