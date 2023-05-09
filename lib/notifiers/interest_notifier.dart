part of classifyme_notifiers;

class InterestNotifier extends ChangeNotifier {
  Interest _interest = Interest.none;
  Interest get interest => _interest;

  void setInterest(Interest interest) {
    _interest = interest;
    notifyListeners();
  }
}
