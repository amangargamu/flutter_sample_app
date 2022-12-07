// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:grappus_mobile/app/app.dart';
import 'package:grappus_mobile/navigation/routes.gr.dart';
import 'package:grappus_mobile/theme/custom_theme.dart';
import 'package:grappus_mobile/utils/prefs.dart';

void main() {
  setUp(() async {
    final getIt = GetIt.instance;
    await Prefs.init();
    getIt.registerSingleton<AppRouter>(AppRouter());
  });
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(CustomTheme), findsOneWidget);
    });
  });
}
