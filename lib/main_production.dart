// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:bigspoon_foods/app/app.dart';
import 'package:bigspoon_foods/bootstrap.dart';
import 'package:bigspoon_foods/di/service_locator.dart';

void main() {
  setup();
  bootstrap(() => const App());
}
