import 'package:flutter/material.dart';
import 'package:grappus_mobile/change_language/provider/change_language_notifier.dart';
import 'package:grappus_mobile/l10n/l10n.dart';
import 'package:grappus_mobile/typography/text_styles.dart';
import 'package:provider/provider.dart';

class ChangeLanguageSettingsPage extends StatelessWidget {
  const ChangeLanguageSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final changeLanguageNotifier = Provider.of<ChangeLanguageNotifier>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.changeLanguageTitle,
          style: context.textTheme.bodyText1,
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            children: List.generate(
              AppLocalizations.supportedLocales.length,
              (index) => Row(
                children: [
                  Text(AppLocalizations.supportedLocales[index].toString()),
                  const Spacer(),
                  Radio<String>(
                    groupValue: changeLanguageNotifier.localeLanguageCode,
                    value: AppLocalizations.supportedLocales[index].toString(),
                    onChanged: (value) {
                      debugPrint('Localization: $value');
                      changeLanguageNotifier
                          .updateLocaleValue(value.toString());
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
