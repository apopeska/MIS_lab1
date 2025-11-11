import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/main.dart';

void main() {
  testWidgets('App shows the exam list screen title', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const ExamApp());

    expect(find.textContaining('Распоред за испити'), findsOneWidget);
  });
}
