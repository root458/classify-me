import 'package:classifyme/classifyme/classifyme.dart';
import 'package:classifyme/counter/counter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(const ClassifyMe());
      expect(find.byType(CounterPage), findsOneWidget);
    });
  });
}
