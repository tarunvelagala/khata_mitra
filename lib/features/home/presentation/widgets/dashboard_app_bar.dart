import 'package:flutter/material.dart';

import '../../../../core/constants/app_dimensions.dart';
import '../../../../l10n/app_localizations.dart';

abstract final class _Dims {
  static const double avatarRadius = 18.0;
  static const double iconSize     = 22.0;
}

// Brand wordmark is always Latin regardless of locale — same as OkCredit/PhonePe.
const String _kBrandName = 'KhataPro';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final cs   = Theme.of(context).colorScheme;
    final tt   = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.buttonPaddingH,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              _kBrandName,
              style: tt.titleLarge?.copyWith(
                color: cs.primary,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_outlined,
              size: _Dims.iconSize,
              color: cs.onSurfaceVariant,
            ),
            tooltip: l10n.appBarNotificationsTooltip,
          ),
          CircleAvatar(
            radius: _Dims.avatarRadius,
            backgroundColor: cs.primaryContainer,
            child: Icon(
              Icons.person_rounded,
              size: _Dims.iconSize,
              color: cs.onPrimaryContainer,
            ),
          ),
        ],
      ),
    );
  }
}
