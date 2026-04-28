import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/constants/app_dimensions.dart';
import '../../../../l10n/app_localizations.dart';

abstract final class _Dims {
  static const double balanceFontSize  = 36.0;
  static const double eyeIconSize      = 22.0;
  static const double cardPaddingV     = 24.0;
  static const double labelToAmountGap = 4.0;
}

class BalanceCard extends StatelessWidget {
  const BalanceCard({
    super.key,
    required this.netBalance,
    required this.isMasked,
    required this.onToggleMask,
  });

  final double netBalance;
  final bool isMasked;
  final VoidCallback onToggleMask;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final cs   = Theme.of(context).colorScheme;
    final tt   = Theme.of(context).textTheme;
    final locale = Localizations.localeOf(context).toString();

    final Color bg;
    final Color fg;
    final Color labelColor;
    if (netBalance > 0) {
      bg         = cs.secondaryContainer;
      fg         = cs.onSecondaryContainer;
      labelColor = cs.onSecondaryContainer.withValues(alpha: AppDimensions.subtleLabelAlpha);
    } else if (netBalance < 0) {
      bg         = cs.tertiaryContainer;
      fg         = cs.onTertiaryContainer;
      labelColor = cs.onTertiaryContainer.withValues(alpha: AppDimensions.subtleLabelAlpha);
    } else {
      bg         = cs.primaryContainer;
      fg         = cs.onPrimaryContainer;
      labelColor = cs.onPrimaryContainer.withValues(alpha: AppDimensions.subtleLabelAlpha);
    }

    final formatted = isMasked
        ? '₹ ••••'
        : NumberFormat.currency(
            locale: locale,
            symbol: '₹ ',
            decimalDigits: 0,
          ).format(netBalance.abs());

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.buttonPaddingH,
        vertical: _Dims.cardPaddingV,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.balanceCardLabel,
                  style: tt.labelMedium?.copyWith(color: labelColor),
                ),
                const SizedBox(height: _Dims.labelToAmountGap),
                Text(
                  formatted,
                  style: tt.headlineLarge?.copyWith(
                    fontSize: _Dims.balanceFontSize,
                    color: fg,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: onToggleMask,
            icon: Icon(
              isMasked ? Icons.visibility_off_rounded : Icons.visibility_rounded,
              size: _Dims.eyeIconSize,
              color: fg,
            ),
            tooltip: isMasked ? l10n.balanceShowTooltip : l10n.balanceHideTooltip,
          ),
        ],
      ),
    );
  }
}
