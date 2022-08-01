/*
 * @author Noor Bhatia
 * Created on 28-07-2022
 */
import 'package:bigspoon_foods/typography/text_styles.dart';
import 'package:bigspoon_foods/utils/app_colors.dart';
import 'package:bigspoon_foods/utils/prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

part 'theme_constants.dart';
part 'theme_manager.dart';

typedef CustomThemeBuilder = Widget Function(ThemeMode mode);

class CustomTheme extends StatefulWidget {
  const CustomTheme({Key? key, required this.builder}) : super(key: key);
  final CustomThemeBuilder builder;

  @override
  State<CustomTheme> createState() => _CustomThemeState();

  static CustomThemeManager of(BuildContext context) =>
      context.findAncestorStateOfType<State<CustomTheme>>()!
          as CustomThemeManager;
}

class _CustomThemeState extends State<CustomTheme>
    with WidgetsBindingObserver, CustomThemeManager {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) => widget.builder(themeMode);

  @override
  void updateState() {
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    modeChangeNotifier.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangePlatformBrightness() {
    super.didChangePlatformBrightness();
    if (Prefs.getTheme == CustomThemeMode.system && mounted) setState(() {});
  }
}
