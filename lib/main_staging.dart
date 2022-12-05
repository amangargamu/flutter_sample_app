// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:grappus_mobile/app/app.dart';
import 'package:grappus_mobile/app/view/app.dart';
import 'package:grappus_mobile/bootstrap.dart';
import 'package:grappus_mobile/di/service_locator.dart';

Future<void> main() async {
  await setupDependencyLocator();
  await bootstrap(() => const App());
}
