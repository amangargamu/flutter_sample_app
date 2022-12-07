import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:grappus_mobile/navigation/routes.gr.dart';
import 'package:grappus_mobile/typography/text_styles.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings', style: context.textTheme.bodyText1),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => context.pushRoute(const CounterPageRoute()),
              child: const Padding(
                padding: EdgeInsets.all(8),
                child: Text('Change Theme'),
              ),
            ),
            GestureDetector(
              onTap: () =>
                  context.pushRoute(const ChangeLanguageSettingsPageRoute()),
              child: const Padding(
                padding: EdgeInsets.all(8),
                child: Text('Change Language'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
