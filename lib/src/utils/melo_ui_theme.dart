import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:melo_ui/src/utils/melo_ui_colors.dart';

class MeloUITheme {
  static ThemeData generateTheme({MeloUIColors? colors}) {
    colors = colors ?? MeloUIColors();
    return ThemeData(
        primaryColorLight: colors.highlight,
        colorScheme: ColorScheme(
          background: colors.dominant,
          brightness: Brightness.light,
          error: colors.error,
          onBackground: colors.dominant,
          onError: colors.error,
          onPrimary: colors.onHighlight,
          onSecondary: colors.secondary,
          onSurface: colors.onHighlight,
          primary: colors.onHighlight,
          secondary: colors.secondary,
          surface: colors.highlight,
        ),
        appBarTheme: AppBarTheme(backgroundColor: colors.dominant),
        scaffoldBackgroundColor: colors.dominant,
        inputDecorationTheme: InputDecorationTheme(
            contentPadding: const EdgeInsets.all(8),
            errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: colors.error),
                borderRadius: BorderRadius.circular(8)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: colors.highlight),
                borderRadius: BorderRadius.circular(8)),
            border: OutlineInputBorder(
                borderSide: const BorderSide(style: BorderStyle.none, width: 0),
                borderRadius: BorderRadius.circular(8)),
            filled: true,
            fillColor: Colors.grey.withOpacity(0.2)),
        textTheme: GoogleFonts.ralewayTextTheme(),
        buttonTheme: const ButtonThemeData(),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: colors.highlight,
                disabledMouseCursor: SystemMouseCursors.forbidden,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)))),
        textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
          foregroundColor: colors.onHighlight,
        )));
  }
}
