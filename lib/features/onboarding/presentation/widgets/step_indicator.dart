import 'package:flutter/material.dart';
import '../../../../core/constants/app_dimensions.dart';

abstract final class _Dims {
  static const double dotSize          = 8;
  static const double dotRadius        = AppDimensions.radiusPill;
  static const double dotSpacing       = 8;
  static const int    animationMs      = 200;
}

/// Pill-shaped step progress indicator used across all onboarding screens.
///
/// The active step is shown as a wider pill; inactive steps are square dots.
class OnboardingStepIndicator extends StatelessWidget {
  const OnboardingStepIndicator({
    super.key,
    required this.current,
    required this.total,
  });

  /// 1-based index of the current step.
  final int current;

  /// Total number of steps.
  final int total;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(total, (i) {
        final isActive = i + 1 == current;
        return Padding(
          padding: EdgeInsets.only(right: i < total - 1 ? _Dims.dotSpacing : 0),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: _Dims.animationMs),
            width: isActive ? _Dims.dotSize * 3 : _Dims.dotSize,
            height: _Dims.dotSize,
            decoration: BoxDecoration(
              color: isActive ? cs.primary : cs.outlineVariant,
              borderRadius: BorderRadius.circular(_Dims.dotRadius),
            ),
          ),
        );
      }),
    );
  }
}
