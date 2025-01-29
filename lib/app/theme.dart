import 'package:flutter/material.dart';
import 'package:travenor/app/colors.dart';

class AppTheme {
  static ThemeData get theme {
    return ThemeData(
      // * SCAFFOLD BACKGROUND COLOR
      scaffoldBackgroundColor: Colors.white,

      // * INPUT DECORATION
      inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(12),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(12),
          ),
          fillColor: AppColors.greyBackgroundTextfield,
          filled: true,
          contentPadding: EdgeInsets.all(16)),
    );
  }
}
