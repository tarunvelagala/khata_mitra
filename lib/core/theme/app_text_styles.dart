import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ── Private type scale tokens ──────────────────────────────────────────────
// These are implementation details of the typography system.
// Callers should use AppTextStyles, never these raw numbers.
abstract final class _TypeScale {
  // Font sizes
  static const double displayLarge   = 57;
  static const double displayMedium  = 45;
  static const double displaySmall   = 36;
  static const double headlineLarge  = 32;
  static const double headlineMedium = 28;
  static const double headlineSmall  = 24;
  static const double titleLarge     = 22;
  static const double titleMedium    = 16;
  static const double titleSmall     = 14;
  static const double bodyLarge      = 16;
  static const double bodyMedium     = 14;
  static const double bodySmall      = 12;
  static const double labelLarge     = 14;
  static const double labelMedium    = 12;
  static const double labelSmall     = 11;

  // Letter spacing
  static const double spacingTight2 = -0.50;
  static const double spacingTight1 = -0.25;
  static const double spacingXs     =  0.10;
  static const double spacingSm     =  0.15;
  static const double spacingMd     =  0.25;
  static const double spacingLg     =  0.40;
  static const double spacingXl     =  0.50;
  static const double spacingXxl    =  1.00;
}

/// Typography system for KhataPro.
///
/// [forLocale] always returns the same brand fonts (Plus Jakarta Sans +
/// Inter). For Indic locales, the matching Noto Sans family is appended as
/// a [fontFamilyFallback] on every style — Flutter uses it automatically
/// for any character the primary font cannot render (Telugu, Devanagari,
/// Tamil, etc.) while all Latin text (numbers, UI labels) stays in brand
/// fonts.
///
/// `inherit: true` is set on every style so Flutter can lerp between light
/// and dark ThemeData without "Failed to interpolate TextStyles" errors.
/// Colors are intentionally absent — resolved by ThemeData.textTheme.
abstract final class AppTextStyles {
  /// Returns a [TextTheme] with the correct fallback fonts for [locale].
  static TextTheme forLocale(Locale locale) {
    final fallback = _indicFallback(locale.languageCode);
    if (fallback == null) return _baseTheme;
    return _cached.putIfAbsent(locale.languageCode, () => _withFallback(fallback));
  }

  // ── Indic fallback font name per language code ─────────────────────────
  static String? _indicFallback(String langCode) => switch (langCode) {
    'hi' => 'Noto Sans Devanagari',
    'te' => 'Noto Sans Telugu',
    'ta' => 'Noto Sans Tamil',
    'kn' => 'Noto Sans Kannada',
    'ml' => 'Noto Sans Malayalam',
    _    => null,
  };

  // Cache per language code to avoid rebuilding on every theme change.
  static final Map<String, TextTheme> _cached = {};

  /// Appends [fallbackFamily] to every style's fontFamilyFallback list.
  /// Brand fonts remain primary; fallback only activates for glyphs they
  /// cannot render.
  static TextTheme _withFallback(String fallbackFamily) {
    TextStyle addFallback(TextStyle? style) {
      if (style == null) return TextStyle(fontFamilyFallback: [fallbackFamily]);
      final existing = style.fontFamilyFallback ?? [];
      return style.copyWith(fontFamilyFallback: [...existing, fallbackFamily]);
    }

    return TextTheme(
      displayLarge:   addFallback(_baseTheme.displayLarge),
      displayMedium:  addFallback(_baseTheme.displayMedium),
      displaySmall:   addFallback(_baseTheme.displaySmall),
      headlineLarge:  addFallback(_baseTheme.headlineLarge),
      headlineMedium: addFallback(_baseTheme.headlineMedium),
      headlineSmall:  addFallback(_baseTheme.headlineSmall),
      titleLarge:     addFallback(_baseTheme.titleLarge),
      titleMedium:    addFallback(_baseTheme.titleMedium),
      titleSmall:     addFallback(_baseTheme.titleSmall),
      bodyLarge:      addFallback(_baseTheme.bodyLarge),
      bodyMedium:     addFallback(_baseTheme.bodyMedium),
      bodySmall:      addFallback(_baseTheme.bodySmall),
      labelLarge:     addFallback(_baseTheme.labelLarge),
      labelMedium:    addFallback(_baseTheme.labelMedium),
      labelSmall:     addFallback(_baseTheme.labelSmall),
    );
  }

  // ── Base theme — Plus Jakarta Sans (headlines) + Inter (body/labels) ───

  static final TextTheme _baseTheme = TextTheme(
    displayLarge:   displayLarge,
    displayMedium:  displayMedium,
    displaySmall:   displaySmall,
    headlineLarge:  headlineLarge,
    headlineMedium: headlineMedium,
    headlineSmall:  headlineSmall,
    titleLarge:     titleLarge,
    titleMedium:    titleMedium,
    titleSmall:     titleSmall,
    bodyLarge:      bodyLarge,
    bodyMedium:     bodyMedium,
    bodySmall:      bodySmall,
    labelLarge:     labelLarge,
    labelMedium:    labelMedium,
    labelSmall:     labelSmall,
  );

  // ── Display ───────────────────────────────────────────────────────────
  static TextStyle get displayLarge => GoogleFonts.plusJakartaSans(
        fontSize: _TypeScale.displayLarge,
        fontWeight: FontWeight.w400,
        letterSpacing: _TypeScale.spacingTight1,
      ).copyWith(inherit: true);

  static TextStyle get displayMedium => GoogleFonts.plusJakartaSans(
        fontSize: _TypeScale.displayMedium,
        fontWeight: FontWeight.w400,
      ).copyWith(inherit: true);

  static TextStyle get displaySmall => GoogleFonts.plusJakartaSans(
        fontSize: _TypeScale.displaySmall,
        fontWeight: FontWeight.w400,
      ).copyWith(inherit: true);

  // ── Headline ──────────────────────────────────────────────────────────
  static TextStyle get headlineLarge => GoogleFonts.plusJakartaSans(
        fontSize: _TypeScale.headlineLarge,
        fontWeight: FontWeight.w800,
        letterSpacing: _TypeScale.spacingTight2,
      ).copyWith(inherit: true);

  static TextStyle get headlineMedium => GoogleFonts.plusJakartaSans(
        fontSize: _TypeScale.headlineMedium,
        fontWeight: FontWeight.w700,
        letterSpacing: _TypeScale.spacingTight1,
      ).copyWith(inherit: true);

  static TextStyle get headlineSmall => GoogleFonts.plusJakartaSans(
        fontSize: _TypeScale.headlineSmall,
        fontWeight: FontWeight.w700,
      ).copyWith(inherit: true);

  // ── Title ─────────────────────────────────────────────────────────────
  static TextStyle get titleLarge => GoogleFonts.plusJakartaSans(
        fontSize: _TypeScale.titleLarge,
        fontWeight: FontWeight.w700,
      ).copyWith(inherit: true);

  static TextStyle get titleMedium => GoogleFonts.inter(
        fontSize: _TypeScale.titleMedium,
        fontWeight: FontWeight.w600,
        letterSpacing: _TypeScale.spacingSm,
      ).copyWith(inherit: true);

  static TextStyle get titleSmall => GoogleFonts.inter(
        fontSize: _TypeScale.titleSmall,
        fontWeight: FontWeight.w600,
        letterSpacing: _TypeScale.spacingXs,
      ).copyWith(inherit: true);

  // ── Body ──────────────────────────────────────────────────────────────
  static TextStyle get bodyLarge => GoogleFonts.inter(
        fontSize: _TypeScale.bodyLarge,
        fontWeight: FontWeight.w400,
        letterSpacing: _TypeScale.spacingXl,
      ).copyWith(inherit: true);

  static TextStyle get bodyMedium => GoogleFonts.inter(
        fontSize: _TypeScale.bodyMedium,
        fontWeight: FontWeight.w400,
        letterSpacing: _TypeScale.spacingMd,
      ).copyWith(inherit: true);

  static TextStyle get bodySmall => GoogleFonts.inter(
        fontSize: _TypeScale.bodySmall,
        fontWeight: FontWeight.w400,
        letterSpacing: _TypeScale.spacingLg,
      ).copyWith(inherit: true);

  // ── Label ─────────────────────────────────────────────────────────────
  static TextStyle get labelLarge => GoogleFonts.inter(
        fontSize: _TypeScale.labelLarge,
        fontWeight: FontWeight.w600,
        letterSpacing: _TypeScale.spacingXs,
      ).copyWith(inherit: true);

  static TextStyle get labelMedium => GoogleFonts.inter(
        fontSize: _TypeScale.labelMedium,
        fontWeight: FontWeight.w500,
        letterSpacing: _TypeScale.spacingXl,
      ).copyWith(inherit: true);

  static TextStyle get labelSmall => GoogleFonts.inter(
        fontSize: _TypeScale.labelSmall,
        fontWeight: FontWeight.w700,
        letterSpacing: _TypeScale.spacingXxl,
      ).copyWith(inherit: true);
}
