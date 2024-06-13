import 'package:flutter/material.dart';
import 'package:gym_club_mobile/core/extensions/context_extension.dart';
import 'package:intl/find_locale.dart';

class CoreUtils {
  const CoreUtils._();

  static void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Center(
            child: Text(message),
          ),
          behavior: SnackBarBehavior.floating,
          backgroundColor: context.theme.snackBarTheme.backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          margin: const EdgeInsets.all(10),
        ),
      );
  }

  static Future<String> getLocale() async => findSystemLocale();
}
