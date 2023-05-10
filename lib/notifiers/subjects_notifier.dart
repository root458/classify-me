part of classifyme_notifiers;

class SubjectsNotifier extends ChangeNotifier {
  bool _goodToGo = false;
  bool get goodToGo => _goodToGo;

  Map<String, String> _subjects = {
    'Mathematics': '__',
    'Physics': '__',
    'English': '__',
    'Biology': '__',
    'Kiswahili': '__',
    'Chemistry': '__',
  };

  Map<String, String> get subjects => _subjects;

  void setSubjectGrade(String subject, String grade) {
    _subjects[subject] = grade;

    if (!_subjects.values.any((element) => element == '__')) {
      _goodToGo = true;
    }
    notifyListeners();
  }

  Map<String, int> getSubjectPerformance() {
    return {
      'Mathematics': Misc.getPoints(_subjects['Mathematics']!),
      'Physics': Misc.getPoints(_subjects['Physics']!),
      'English': Misc.getPoints(_subjects['English']!),
      'Biology': Misc.getPoints(_subjects['Biology']!),
      'Kiswahili': Misc.getPoints(_subjects['Kiswahili']!),
      'Chemistry': Misc.getPoints(_subjects['Chemistry']!),
    };
  }

  void resetPerformances() {
    _subjects = {
      'Mathematics': '__',
      'Physics': '__',
      'English': '__',
      'Biology': '__',
      'Kiswahili': '__',
      'Chemistry': '__',
    };
    notifyListeners();
  }
}
