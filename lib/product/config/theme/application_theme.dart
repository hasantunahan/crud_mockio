import 'package:flutter/material.dart';

part 'colors/colors.dart';
part 'text_theme/text_themes.dart';

class ApplicationTheme {

  static ThemeData defaultTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: _DefaultThemeColors.primary,
      primaryContainer: _DefaultThemeColors.primaryContainer,
      onPrimary: _DefaultThemeColors.onPrimary,
      onPrimaryContainer: _DefaultThemeColors.onPrimaryContainer,
      secondary: _DefaultThemeColors.secondary,
      secondaryContainer: _DefaultThemeColors.secondaryContainer,
      onSecondary: _DefaultThemeColors.onSecondary,
      onSecondaryContainer: _DefaultThemeColors.onSecondaryContainer,
      tertiary: _DefaultThemeColors.tertiary,
      tertiaryContainer: _DefaultThemeColors.tertiaryContainer,
      onTertiary: _DefaultThemeColors.onTertiary,
      onTertiaryContainer: _DefaultThemeColors.onTertiaryContainer,
      error: _DefaultThemeColors.error,
      background: _DefaultThemeColors.white,
      surface: _DefaultThemeColors.inactive,
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      linearTrackColor: _DefaultThemeColors.inactive,
      color: _DefaultThemeColors.secondary,
      linearMinHeight: 1,
    ),
    scaffoldBackgroundColor: _DefaultThemeColors.primary,
    textTheme: _TextThemes.defaultTextTheme,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      elevation: 0.0,
      backgroundColor: _DefaultThemeColors.white,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: _DefaultThemeColors.secondary,
      toolbarHeight: kToolbarHeight * 1.8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      iconTheme: IconThemeData(
        color: _DefaultThemeColors.white,
      )
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.resolveWith(
          (states) {
            return _TextThemes.defaultTextTheme.bodyText1?.copyWith(
              color: states.contains(MaterialState.disabled)
                  ? _DefaultThemeColors.secondaryContainer
                  : _DefaultThemeColors.secondary,
              fontWeight: FontWeight.w700,
            );
          },
        ),
        shape: MaterialStateProperty.resolveWith<OutlinedBorder>((_) {
          return RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16));
        }),
        foregroundColor: MaterialStateProperty.resolveWith((states) {
          return states.contains(MaterialState.disabled)
              ? _DefaultThemeColors.secondaryContainer
              : _DefaultThemeColors.secondary;
        }),
        backgroundColor: MaterialStateProperty.resolveWith(
          (states) {
            return states.contains(MaterialState.disabled)
                ? _DefaultThemeColors.inactive
                : _DefaultThemeColors.tertiary;
          },
        ),
        side: MaterialStateProperty.resolveWith(
          (states) => BorderSide(
            width: 1,
            color: states.contains(MaterialState.disabled)
                ? _DefaultThemeColors.inactive
                : _DefaultThemeColors.tertiary,
          ),
        ),
      ),
    ),
    sliderTheme: const SliderThemeData(
      thumbColor: _DefaultThemeColors.tertiary,
      activeTrackColor: _DefaultThemeColors.tertiary,
      inactiveTrackColor: _DefaultThemeColors.secondary,
      trackShape: RoundedRectSliderTrackShape(),
      trackHeight: 6.0,
      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
      overlayShape: RoundSliderOverlayShape(overlayRadius: 4.0),
    ),
  );
}
