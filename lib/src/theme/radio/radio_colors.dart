import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:moon_design/src/utils/color_premul_lerp.dart';

@immutable
class MoonRadioColors extends ThemeExtension<MoonRadioColors> with DiagnosticableTreeMixin {
  /// The color of the selected MoonRadio button.
  final Color activeColor;

  /// The background color of the unselected MoonRadio button.
  final Color inactiveColor;

  /// The text color of the MoonRadio with label button.
  final Color textColor;

  const MoonRadioColors({
    required this.activeColor,
    required this.inactiveColor,
    required this.textColor,
  });

  @override
  MoonRadioColors copyWith({
    Color? activeColor,
    Color? inactiveColor,
    Color? textColor,
  }) {
    return MoonRadioColors(
      activeColor: activeColor ?? this.activeColor,
      inactiveColor: inactiveColor ?? this.inactiveColor,
      textColor: textColor ?? this.textColor,
    );
  }

  @override
  MoonRadioColors lerp(ThemeExtension<MoonRadioColors>? other, double t) {
    if (other is! MoonRadioColors) return this;

    return MoonRadioColors(
      activeColor: colorPremulLerp(activeColor, other.activeColor, t)!,
      inactiveColor: colorPremulLerp(inactiveColor, other.inactiveColor, t)!,
      textColor: colorPremulLerp(textColor, other.textColor, t)!,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty("type", "MoonRadioColors"))
      ..add(ColorProperty("activeColor", activeColor))
      ..add(ColorProperty("inactiveColor", inactiveColor))
      ..add(ColorProperty("textColor", textColor));
  }
}
