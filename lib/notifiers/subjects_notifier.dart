part of classifyme_notifiers;

class SubjectsNotifier extends ChangeNotifier {
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
    notifyListeners();
  }
}
