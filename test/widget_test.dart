import 'package:flutter_test/flutter_test.dart';
import 'package:bytestacked/main.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const BytestackedApp());
    await tester.pump(const Duration(milliseconds: 500));
    expect(find.textContaining('bytestacked', findRichText: true), findsWidgets);
  });
}
