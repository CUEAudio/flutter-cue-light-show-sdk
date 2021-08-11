import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_cue_light_show_sdk/flutter_cue_light_show_sdk.dart';

void main() {
  const MethodChannel channel = MethodChannel('flutter_cue_light_show_sdk');

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
    expect(await FlutterCueLightShowSdk.platformVersion, '42');
  });
}
