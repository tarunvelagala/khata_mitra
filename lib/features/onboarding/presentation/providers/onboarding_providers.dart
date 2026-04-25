import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../l10n/app_localizations.dart';

enum AppLanguage {
  english('English', 'Default', 'en'),
  hindi('हिन्दी', 'Hindi', 'hi'),
  kannada('ಕನ್ನಡ', 'Kannada', 'kn'),
  tamil('தமிழ்', 'Tamil', 'ta'),
  bengali('বাংলা', 'Bengali', 'bn'),
  marathi('मराठी', 'Marathi', 'mr'),
  malayalam('മലയാളം', 'Malayalam', 'ml'),
  telugu('తెలుగు', 'Telugu', 'te');

  const AppLanguage(this.nativeName, this.englishName, this.code);
  final String nativeName;
  final String englishName;
  final String code;
}

class SelectedLanguageNotifier extends Notifier<AppLanguage> {
  @override
  AppLanguage build() => AppLanguage.english;

  void select(AppLanguage language) => state = language;
}

final selectedLanguageProvider =
    NotifierProvider<SelectedLanguageNotifier, AppLanguage>(
  SelectedLanguageNotifier.new,
);

// ── Theme preference ──────────────────────────────────────────────────────────

class ThemeModeNotifier extends Notifier<ThemeMode> {
  @override
  ThemeMode build() => ThemeMode.system;

  void select(ThemeMode mode) => state = mode;
}

final themeModeProvider = NotifierProvider<ThemeModeNotifier, ThemeMode>(
  ThemeModeNotifier.new,
);

// ── Shop details ──────────────────────────────────────────────────────────────

enum BusinessType {
  retail(Icons.storefront_outlined),
  wholesale(Icons.warehouse_outlined),
  services(Icons.handyman_outlined),
  restaurant(Icons.restaurant_outlined),
  pharmacy(Icons.local_pharmacy_outlined),
  other(Icons.category_outlined);

  const BusinessType(this.icon);
  final IconData icon;

  String localizedLabel(AppLocalizations l10n) => switch (this) {
        BusinessType.retail => l10n.businessTypeRetail,
        BusinessType.wholesale => l10n.businessTypeWholesale,
        BusinessType.services => l10n.businessTypeServices,
        BusinessType.restaurant => l10n.businessTypeRestaurant,
        BusinessType.pharmacy => l10n.businessTypePharmacy,
        BusinessType.other => l10n.businessTypeOther,
      };
}

class ShopDetails {
  const ShopDetails({this.name = '', this.businessType});

  final String name;
  final BusinessType? businessType;

  ShopDetails copyWith({String? name, BusinessType? businessType}) =>
      ShopDetails(
        name: name ?? this.name,
        businessType: businessType ?? this.businessType,
      );

  bool get isValid => name.trim().isNotEmpty && businessType != null;
}

class ShopDetailsNotifier extends Notifier<ShopDetails> {
  @override
  ShopDetails build() => const ShopDetails();

  void setName(String name) => state = state.copyWith(name: name);
  void setBusinessType(BusinessType type) =>
      state = state.copyWith(businessType: type);
}

final shopDetailsProvider = NotifierProvider<ShopDetailsNotifier, ShopDetails>(
  ShopDetailsNotifier.new,
);

// ── Onboarding completion ─────────────────────────────────────────────────────

class OnboardingCompleteNotifier extends Notifier<bool> {
  @override
  bool build() => false;

  void complete() => state = true;
}

final isOnboardingCompleteProvider =
    NotifierProvider<OnboardingCompleteNotifier, bool>(
  OnboardingCompleteNotifier.new,
);
