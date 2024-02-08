// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
//
import 'package:flutter/material.dart';
import 'package:flutter_bloc_lab/core/network.dart';
import 'package:flutter_bloc_lab/core/repository/user_repo.dart';
import 'package:flutter_bloc_lab/page/challenge_page.dart';
import 'package:flutter_bloc_lab/page/test_page.dart';
import 'package:flutter_bloc_lab/page/user_page.dart';
import 'package:http/http.dart' as http;
//



import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_bloc_lab/main.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

void main() 
{
  // testWidgets('Counter increments smoke test', (WidgetTester tester) async {
  //   // Build our app and trigger a frame.
  //   await tester.pumpWidget(const MyApp());

  //   // Verify that our counter starts at 0.
  //   expect(find.text('0'), findsOneWidget);
  //   expect(find.text('1'), findsNothing);

  //   // Tap the '+' icon and trigger a frame.
  //   await tester.tap(find.byIcon(Icons.add));
  //   await tester.pump();

  //   // Verify that our counter has incremented.
  //   expect(find.text('0'), findsNothing);
  //   expect(find.text('1'), findsOneWidget);
  // });

  final UserRepository userRepository = UserRepository
  (
    userApiClient: UserApiClient
    (
      httpClient: http.Client()
    )
  );

  setUpAll(() => {loadAppFonts()});
  testGoldens
  (
    'DeviceBuilder - multiple scenaruos',
    (tester) async
    {
      final builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios
      (
        devices:
        [
          Device.phone
        ]
      )
      ..addScenario
      (
        widget: MainApp(userRepository: userRepository,),
        name: 'First Test Page',
      );

      await tester.pumpDeviceBuilder
      (
        builder,
        wrapper: materialAppWrapper
        (
          theme: ThemeData.light(),
          platform: TargetPlatform.android
        )
      );

      await screenMatchesGolden(tester, 'first_screenshot');
    }
  );
}
