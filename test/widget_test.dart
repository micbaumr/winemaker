import 'package:flutter_test/flutter_test.dart';
import 'package:winemaker/main.dart';

void main() {
  testWidgets('Should show task list when started', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    expect(find.text('Start Winemaker'), findsOneWidget);

    await tester.tap(find.text("Start Winemaker"));
    await tester.pumpAndSettle();

    expect(find.text('Must parameters measurement'), findsOneWidget);
    expect(find.text('Must parameters displayed'), findsOneWidget);
  });
}
