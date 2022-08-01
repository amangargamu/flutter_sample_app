// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:bigspoon_foods/theme/custom_theme.dart';
import 'package:bigspoon_foods/typography/text_styles.dart';
import 'package:flutter/material.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({Key? key}) : super(key: key);

  //final userRepository = getIt.get<UserRepository>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Theme App', style: context.textTheme.bodyText1),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            children: List.generate(
              3,
              (index) => Row(
                children: [
                  Text(CustomThemeMode.values[index].name),
                  const Spacer(),
                  Radio(
                    value: CustomThemeMode.values[index],
                    groupValue: CustomTheme.of(context).mode,
                    onChanged: (value) {
                      debugPrint('THEME:$value');
                      CustomTheme.of(context)
                          .setThemeMode(value! as CustomThemeMode);
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
