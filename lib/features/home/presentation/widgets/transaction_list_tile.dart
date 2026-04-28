import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/constants/app_dimensions.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/models/transaction.dart';

abstract final class _Dims {
  static const double avatarRadius   = 20.0;
  static const double avatarFontSize = 13.0;
  static const double badgePaddingH  = 6.0;
  static const double badgePaddingV  = 2.0;
  static const double badgeRadius    = 4.0;
  static const double tileMinHeight  = 64.0;
}

// Financial terms kept in English — universally understood on bank statements
// and ATM receipts across all South Asian markets.
const String _kCredit = 'CREDIT';
const String _kDebit  = 'DEBIT';

class TransactionListTile extends StatelessWidget {
  const TransactionListTile({
    super.key,
    required this.transaction,
    required this.isMasked,
  });

  final Transaction transaction;
  final bool isMasked;

  @override
  Widget build(BuildContext context) {
    final cs     = Theme.of(context).colorScheme;
    final tt     = Theme.of(context).textTheme;
    final locale = Localizations.localeOf(context).toString();
    final l10n   = AppLocalizations.of(context)!;

    final amountColor = transaction.isCredit ? cs.secondary : cs.tertiary;
    final amountPrefix = transaction.isCredit ? '+ ' : '- ';

    final formattedAmount = isMasked
        ? '₹ ••••'
        : '$amountPrefix₹ ${NumberFormat.currency(
            locale: locale,
            symbol: '',
            decimalDigits: 0,
          ).format(transaction.amount).trim()}';

    final formattedDate = _formatDate(transaction.timestamp, l10n);

    return Container(
      constraints: const BoxConstraints(minHeight: _Dims.tileMinHeight),
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.buttonPaddingH,
        vertical: AppDimensions.inputPaddingH,
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: _Dims.avatarRadius,
            backgroundColor: cs.primaryContainer,
            child: Text(
              transaction.avatarLabel,
              style: tt.labelMedium?.copyWith(
                fontSize: _Dims.avatarFontSize,
                color: cs.onPrimaryContainer,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(width: AppDimensions.inputPaddingH),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  transaction.customerName,
                  style: tt.bodyMedium?.copyWith(
                    color: cs.onSurface,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                if (transaction.shopName != null)
                  Text(
                    transaction.shopName!,
                    style: tt.bodySmall?.copyWith(color: cs.onSurfaceVariant),
                    overflow: TextOverflow.ellipsis,
                  ),
                Text(
                  formattedDate,
                  style: tt.bodySmall?.copyWith(color: cs.onSurfaceVariant),
                ),
              ],
            ),
          ),
          const SizedBox(width: AppDimensions.inputPaddingH),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                formattedAmount,
                style: tt.titleSmall?.copyWith(
                  color: amountColor,
                  fontWeight: FontWeight.w700,
                  fontFeatures: const [FontFeature.tabularFigures()],
                ),
              ),
              const SizedBox(height: _Dims.badgePaddingV),
              _Badge(
                label: transaction.isCredit ? _kCredit : _kDebit,
                color: amountColor,
                cs: cs,
                tt: tt,
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime dt, AppLocalizations l10n) {
    final now = DateTime.now();
    final diff = now.difference(dt);
    if (diff.inMinutes < 60) return l10n.txnTimeMinutesAgo(diff.inMinutes);
    if (diff.inHours < 24)   return l10n.txnTimeToday(DateFormat.jm().format(dt));
    if (diff.inDays == 1)    return l10n.txnTimeYesterday(DateFormat.jm().format(dt));
    return DateFormat('d MMM, hh:mm a').format(dt);
  }
}

class _Badge extends StatelessWidget {
  const _Badge({
    required this.label,
    required this.color,
    required this.cs,
    required this.tt,
  });

  final String label;
  final Color color;
  final ColorScheme cs;
  final TextTheme tt;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: _Dims.badgePaddingH,
        vertical: _Dims.badgePaddingV,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: AppDimensions.badgeGlassAlpha),
        borderRadius: BorderRadius.circular(_Dims.badgeRadius),
      ),
      child: Text(
        label,
        style: tt.labelSmall?.copyWith(
          color: color,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.8,
        ),
      ),
    );
  }
}
