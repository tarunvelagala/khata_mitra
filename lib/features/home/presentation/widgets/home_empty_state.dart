import 'package:flutter/material.dart';

import '../../../../core/constants/app_dimensions.dart';
import '../../../../l10n/app_localizations.dart';

abstract final class _Dims {
  static const double iconSize        = 64.0;
  static const double iconToTitleGap  = 16.0;
  static const double titleToBodyGap  = 8.0;
  static const double bodyToCtaGap    = 24.0;
}

class HomeEmptyState extends StatelessWidget {
  const HomeEmptyState({super.key, required this.onAddCustomer});

  final VoidCallback onAddCustomer;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final cs   = Theme.of(context).colorScheme;
    final tt   = Theme.of(context).textTheme;

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.buttonPaddingH,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.people_outline_rounded,
              size: _Dims.iconSize,
              color: cs.outlineVariant,
            ),
            const SizedBox(height: _Dims.iconToTitleGap),
            Text(
              l10n.homeEmptyTitle,
              style: tt.titleLarge?.copyWith(color: cs.onSurface),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: _Dims.titleToBodyGap),
            Text(
              l10n.homeEmptyBody,
              style: tt.bodyMedium?.copyWith(color: cs.onSurfaceVariant),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: _Dims.bodyToCtaGap),
            FilledButton.icon(
              onPressed: onAddCustomer,
              icon: const Icon(Icons.person_add_rounded),
              label: Text(l10n.homeEmptyAddCustomer),
            ),
          ],
        ),
      ),
    );
  }
}
