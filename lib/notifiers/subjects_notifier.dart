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
}
