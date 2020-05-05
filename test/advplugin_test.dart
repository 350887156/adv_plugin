import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:advplugin/advplugin.dart';

void main() {
  const MethodChannel channel = MethodChannel('advplugin');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await Advplugin.platformVersion, '42');
  });
}
