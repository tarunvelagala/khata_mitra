import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:khata_pro/core/theme/app_theme.dart';
import 'package:khata_pro/l10n/app_localizations.dart';

// All 8 supported locales — ordered by script family so failures group neatly.
const allLocales = [
  Locale('en'), // Latin
  Locale('hi'), // Devanagari
  Locale('mr'), // Devanagari
  Locale('bn'), // Bengali
  Locale('kn'), // Kannada
  Locale('ta'), // Tamil
  Locale('ml'), // Malayalam
  Locale('te'), // Telugu
];

// Wraps [child] in the minimum scaffold needed to test locale rendering.
Widget localeHarness(
  Widget child, {
  Locale locale = const Locale('en'),
  Size size = const Size(390, 844),
}) {
  return ProviderScope(
    child: MaterialApp(
      theme: AppTheme.light,
      locale: locale,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      home: MediaQuery(
        data: MediaQueryData(size: size, devicePixelRatio: 2.0),
        child: child,
      ),
    ),
  );
}

// Standard sizes used across the test suite.
const Size iphoneSize     = Size(390, 844); // iPhone 14
const Size androidSize    = Size(360, 800); // Pixel-class
const Size oldAndroidSize = Size(360, 640); // Older budget Android phone
