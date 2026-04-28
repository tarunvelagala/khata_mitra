import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/constants/app_dimensions.dart';
import '../../../../l10n/app_localizations.dart';

abstract final class _Dims {
  static const double pillPaddingV    = 6.0;
  static const double pillPaddingH    = 12.0;
  static const double pillIconSize    = 14.0;
  static const double pillIconGap     = 4.0;
  static const double pillSpacing     = 8.0;
}

class SummaryPills extends StatelessWidget {
  const SummaryPills({
    super.key,
    required this.totalIncome,
    required this.totalExpense,
    required this.isMasked,
  });

  final double totalIncome;
  final double totalExpense;
  final bool isMasked;

  @override
  Widget build(BuildContext context) {
    final l10n   = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context).toString();

    return Row(
      children: [
        Expanded(
          child: _Pill(
            label: l10n.summaryIncomeLabel,
            amount: totalIncome,
            icon: Icons.arrow_downward_rounded,
            isMasked: isMasked,
            locale: locale,
            isIncome: true,
          ),
        ),
        const SizedBox(width: _Dims.pillSpacing),
        Expanded(
          child: _Pill(
            label: l10n.summaryExpenseLabel,
            amount: totalExpense,
            icon: Icons.arrow_upward_rounded,
            isMasked: isMasked,
            locale: locale,
            isIncome: false,
          ),
        ),
      ],
    );
  }
}

class _Pill extends StatelessWidget {
  const _Pill({
    required this.label,
    required this.amount,
    required this.icon,
    required this.isMasked,
    required this.locale,
    required this.isIncome,
  });

  final String label;
  final double amount;
  final IconData icon;
  final bool isMasked;
  final String locale;
  final bool isIncome;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    final bg   = isIncome ? cs.secondaryContainer : cs.tertiaryContainer;
    final fg   = isIncome ? cs.onSecondaryContainer : cs.onTertiaryContainer;

    final formatted = isMasked
        ? '₹ ••••'
        : NumberFormat.currency(
            locale: locale,
            symbol: '₹ ',
            decimalDigits: 0,
          ).format(amount);

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: _Dims.pillPaddingH,
        vertical: _Dims.pillPaddingV,
      ),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(AppDimensions.radiusPill),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: _Dims.pillIconSize, color: fg),
          const SizedBox(width: _Dims.pillIconGap),
          Expanded(
            child: Text(
              '$label  $formatted',
              style: tt.labelMedium?.copyWith(color: fg),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
