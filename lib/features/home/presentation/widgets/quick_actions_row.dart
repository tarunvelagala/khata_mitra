import 'package:flutter/material.dart';

import '../../../../l10n/app_localizations.dart';

abstract final class _Dims {
  static const double buttonSize   = 64.0;
  static const double buttonRadius = 16.0;
  static const double iconSize     = 28.0;
  static const double labelGap     = 8.0;
  static const double tileWidth    = 76.0;
}

class QuickActionsRow extends StatelessWidget {
  const QuickActionsRow({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final cs   = Theme.of(context).colorScheme;
    final tt   = Theme.of(context).textTheme;

    final actions = [
      (icon: Icons.person_add_rounded,         label: l10n.quickActionAddCustomer),
      (icon: Icons.receipt_long_rounded,       label: l10n.quickActionGenerateBill),
      (icon: Icons.notifications_active_rounded, label: l10n.quickActionSendReminder),
      (icon: Icons.payments_rounded,           label: l10n.quickActionRecordPayment),
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: actions.map((a) {
        return SizedBox(
          width: _Dims.tileWidth,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Material(
                color: cs.primaryContainer,
                borderRadius: BorderRadius.circular(_Dims.buttonRadius),
                child: InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(_Dims.buttonRadius),
                  child: SizedBox(
                    width: _Dims.buttonSize,
                    height: _Dims.buttonSize,
                    child: Icon(a.icon, size: _Dims.iconSize, color: cs.primary),
                  ),
                ),
              ),
              const SizedBox(height: _Dims.labelGap),
              Text(
                a.label,
                style: tt.labelSmall?.copyWith(color: cs.onSurfaceVariant),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
