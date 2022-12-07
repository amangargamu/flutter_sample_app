import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:grappus_mobile/l10n/l10n.dart';
import 'package:grappus_mobile/navigation/routes.gr.dart';
import 'package:grappus_mobile/typography/text_styles.dart';

class LanguageHome extends StatelessWidget {
  const LanguageHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home', style: context.textTheme.bodyText1),
        actions: [
          IconButton(
            onPressed: () => context.pushRoute(const SettingsPageRoute()),
            icon: const Icon(
              Icons.settings,
            ),
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Text(context.l10n.counterAppBarTitle),
        ),
      ),
    );
  }
}
