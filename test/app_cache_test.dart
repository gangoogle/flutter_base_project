import 'package:first_project/api/app_cache.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues(<String, Object>{});
    AppCache.resetForTesting();
  });

  test('cache returns defaults and persists user credentials', () async {
    expect(await AppCache.getUserName(), isEmpty);
    expect(await AppCache.getLoginToken(), isEmpty);

    expect(await AppCache.saveUserName('alice'), isTrue);
    expect(await AppCache.saveLoginToken('token-123'), isTrue);
    expect(await AppCache.getUserName(), 'alice');
    expect(await AppCache.getLoginToken(), 'token-123');
  });
}
