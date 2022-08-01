/*
 * @author Noor Bhatia
 * Created on 27-07-2022
 */
part of 'custom_theme.dart';

mixin CustomThemeManager {
  final ValueNotifier<CustomThemeMode> _modeChangeNotifier =
      ValueNotifier(Prefs.getTheme);

  ThemeMode get theme {
    if (Prefs.getTheme == CustomThemeMode.system) {
      final brightness = SchedulerBinding.instance.window.platformBrightness;
      return brightness == Brightness.light ? ThemeMode.light : ThemeMode.dark;
    }
    return Prefs.getTheme == CustomThemeMode.dark
        ? ThemeMode.dark
        : ThemeMode.light;
  }

  /// Returns current theme mode
  CustomThemeMode get mode => Prefs.getTheme;

  /// Returns the default(initial) theme mode

  /// Allows to listen to changes in them mode.
  ValueNotifier<CustomThemeMode> get modeChangeNotifier => _modeChangeNotifier;

  ThemeMode get themeMode => theme;

  /// Sets light theme as current
  void setLight() => setThemeMode(CustomThemeMode.light);

  /// Sets dark theme as current
  void setDark() => setThemeMode(CustomThemeMode.dark);

  /// Sets theme based on the theme of the underlying OS.
  void setSystem() => setThemeMode(CustomThemeMode.system);

  void setThemeMode(CustomThemeMode mode) {
    Prefs.setTheme = mode;
    updateState();
    _modeChangeNotifier.value = mode;
    debugPrint('MODE:${Prefs.getTheme.index}');
  }

  void updateState() {}
}

enum CustomThemeMode {
  light('Light'),
  dark('Dark'),
  system('System');

  const CustomThemeMode(this.modeName);

  final String modeName;
}
