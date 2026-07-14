import 'package:first_project/api/app_cache.dart';
import 'package:first_project/main.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUp(() {
    Get.testMode = true;
    SharedPreferences.setMockInitialValues(<String, Object>{});
    AppCache.resetForTesting();
  });

  tearDown(Get.reset);

  testWidgets('main page renders, counts, navigates and switches tabs', (
    tester,
  ) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    expect(find.text('首页'), findsOneWidget);
    expect(find.text('菜单'), findsOneWidget);
    expect(find.text('0'), findsOneWidget);

    await tester.tap(find.text('0'));
    await tester.pump();
    expect(find.text('1'), findsOneWidget);

    await tester.tap(find.text('菜单'));
    await tester.pumpAndSettle();
    expect(find.text('admin'), findsOneWidget);

    await tester.tap(find.text('首页'));
    await tester.pumpAndSettle();
    await tester.tap(find.textContaining('setting page'));
    await tester.pumpAndSettle();
    expect(find.textContaining('last page args'), findsOneWidget);

    Get.back<String>(result: 'unexpected result type');
    await tester.pumpAndSettle();
    expect(find.text('setting page '), findsOneWidget);
  });
}
