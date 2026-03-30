import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../widgets/step_indicator.dart';

// ── File-private layout constants ──────────────────────────────────────────
abstract final class _Dims {
  // Scroll area padding
  static const double scrollPadH   = 24;
  static const double scrollPadTop = 32;
  static const double scrollPadBot = 16;

  // Bottom CTA bar padding
  static const double ctaPadTop = 12;
  static const double ctaPadBot = 24;

  // Header icon container
  static const double iconContainerPad    = 16;
  static const double iconContainerRadius = AppDimensions.radiusMedium;
  static const double iconContainerAlpha  = 0.08;
  static const double iconSize            = 40;

  // Spacing
  static const double spaceAfterIcon     = 20;
  static const double spaceAfterSubtitle = 8;
  static const double spaceBeforeCards   = 32;
  static const double spaceBetweenCards  = 12;
  static const double spaceAfterButton   = 12;

  // Permission card
  static const double cardPad        = 20;
  static const double cardRadius     = AppDimensions.radiusMedium;
  static const double cardIconSize   = 24;
  static const double cardIconPad    = 10;
  static const double cardIconRadius = AppDimensions.radiusSmall;
  static const double cardIconAlpha  = 0.1;
  static const double cardSpaceIcon  = 16;
  static const double cardSpaceDesc  = 4;

  // Card border
  static const double cardBorderUnselected = AppDimensions.borderDefault;

  // Card shadow
  static const double shadowAlpha   = 0.04;
  static const double shadowBlur    = 8;
  static const double shadowOffsetY = 2;
}

// ── Permission data ───────────────────────────────────────────────────────────

class _PermissionItem {
  const _PermissionItem({
    required this.icon,
    required this.title,
    required this.description,
    required this.why,
  });

  final IconData icon;
  final String title;
  final String description;
  final String why;
}

const _permissions = [
  _PermissionItem(
    icon: Icons.notifications_outlined,
    title: 'Notifications',
    description: 'Payment reminders, due alerts',
    why: 'Never miss a collection',
  ),
  _PermissionItem(
    icon: Icons.contacts_outlined,
    title: 'Contacts',
    description: 'Quickly add customers from phonebook',
    why: 'Faster customer onboarding',
  ),
  _PermissionItem(
    icon: Icons.sms_outlined,
    title: 'SMS (optional)',
    description: 'Auto-read payment confirmations',
    why: 'Reduce manual entry',
  ),
];

class PermissionsScreen extends StatelessWidget {
  const PermissionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // ── Scrollable content ───────────────────────────────────
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(
                  _Dims.scrollPadH,
                  _Dims.scrollPadTop,
                  _Dims.scrollPadH,
                  _Dims.scrollPadBot,
                ),
                child: Column(
                  children: [
                    // Icon container
                    Container(
                      padding: const EdgeInsets.all(_Dims.iconContainerPad),
                      decoration: BoxDecoration(
                        color: cs.primary.withValues(alpha: _Dims.iconContainerAlpha),
                        borderRadius: BorderRadius.circular(_Dims.iconContainerRadius),
                      ),
                      child: Icon(Icons.security_outlined, size: _Dims.iconSize, color: cs.primary),
                    ),
                    const SizedBox(height: _Dims.spaceAfterIcon),

                    // Step indicator
                    const OnboardingStepIndicator(current: 4, total: 4),
                    const SizedBox(height: _Dims.spaceAfterSubtitle),

                    // Title
                    Text('App Permissions', style: tt.headlineMedium, textAlign: TextAlign.center),
                    Text(
                      'अनुमतियाँ',
                      style: tt.headlineSmall?.copyWith(color: cs.primaryContainer),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: _Dims.spaceAfterSubtitle),

                    // Subtitle
                    Text(
                      'We only ask for permissions we truly need. You can change these anytime in Settings.',
                      style: tt.bodyLarge?.copyWith(color: cs.onSurfaceVariant),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: _Dims.spaceBeforeCards),

                    // Permission cards
                    ...List.generate(_permissions.length, (i) => Padding(
                      padding: EdgeInsets.only(
                        bottom: i < _permissions.length - 1 ? _Dims.spaceBetweenCards : 0,
                      ),
                      child: _PermissionCard(permission: _permissions[i]),
                    )),
                  ],
                ),
              ),
            ),

            // ── Bottom CTA ───────────────────────────────────────────
            Container(
              padding: const EdgeInsets.fromLTRB(
                _Dims.scrollPadH,
                _Dims.ctaPadTop,
                _Dims.scrollPadH,
                _Dims.ctaPadBot,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    cs.surface.withValues(alpha: 0),
                    cs.surface,
                  ],
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      key: const ValueKey('btn_permissions_allow'),
                      onPressed: () => context.go('/home'),
                      icon: const Icon(Icons.check),
                      label: const Text('Allow & Continue / अनुमति दें'),
                    ),
                  ),
                  const SizedBox(height: _Dims.spaceAfterButton),
                  SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      key: const ValueKey('btn_permissions_skip'),
                      onPressed: () => context.go('/home'),
                      child: Text(
                        'Skip for now',
                        style: tt.labelLarge?.copyWith(color: cs.onSurfaceVariant),
                      ),
                    ),
                  ),
                  const SizedBox(height: _Dims.spaceAfterButton),
                  Text(
                    'KHATAMITRA DIGITAL BAHI KHATA',
                    style: tt.labelSmall?.copyWith(color: cs.outline),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Permission card ───────────────────────────────────────────────────────────

class _PermissionCard extends StatelessWidget {
  const _PermissionCard({required this.permission});

  final _PermissionItem permission;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.all(_Dims.cardPad),
      decoration: BoxDecoration(
        color: cs.surface,
        borderRadius: BorderRadius.circular(_Dims.cardRadius),
        border: Border.all(color: cs.outlineVariant, width: _Dims.cardBorderUnselected),
        boxShadow: [
          BoxShadow(
            color: cs.shadow.withValues(alpha: _Dims.shadowAlpha),
            blurRadius: _Dims.shadowBlur,
            offset: const Offset(0, _Dims.shadowOffsetY),
          ),
        ],
      ),
      child: Row(
        children: [
          // Icon pill
          Container(
            padding: const EdgeInsets.all(_Dims.cardIconPad),
            decoration: BoxDecoration(
              color: cs.primary.withValues(alpha: _Dims.cardIconAlpha),
              borderRadius: BorderRadius.circular(_Dims.cardIconRadius),
            ),
            child: Icon(permission.icon, color: cs.primary, size: _Dims.cardIconSize),
          ),
          const SizedBox(width: _Dims.cardSpaceIcon),

          // Text
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(permission.title, style: tt.titleSmall),
                const SizedBox(height: _Dims.cardSpaceDesc),
                Text(
                  permission.description,
                  style: tt.bodySmall?.copyWith(color: cs.onSurfaceVariant),
                ),
                const SizedBox(height: _Dims.cardSpaceDesc),
                Row(
                  children: [
                    Icon(Icons.info_outline, size: 12, color: cs.primary),
                    const SizedBox(width: 4),
                    Text(
                      permission.why,
                      style: tt.labelSmall?.copyWith(color: cs.primary),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
