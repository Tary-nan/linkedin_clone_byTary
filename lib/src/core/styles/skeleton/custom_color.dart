import 'package:flutter/material.dart';

@immutable
class CustomColors extends ThemeExtension<CustomColors> {
  final Color? backgroundSearchCard;
  final Color? skeletonColor;
  final Color? iconColor;
  final Color? textColor;

  const CustomColors(
      {required this.backgroundSearchCard,
      required this.skeletonColor,
      required this.iconColor,
      required this.textColor});

  @override
  ThemeExtension<CustomColors> copyWith({
    Color? backgroundSearchCard,
    Color? skeletonColor,
    Color? iconColor,
    Color? textColor,
  }) {
    return CustomColors(
      backgroundSearchCard: backgroundSearchCard ?? this.backgroundSearchCard,
      skeletonColor: skeletonColor ?? this.skeletonColor,
      iconColor: iconColor ?? this.iconColor,
      textColor: textColor ?? this.textColor,
    );
  }

  @override
  ThemeExtension<CustomColors> lerp(
      ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) {
      return this;
    }
    return CustomColors(
      backgroundSearchCard:
          Color.lerp(backgroundSearchCard, other.backgroundSearchCard, t),
      skeletonColor: Color.lerp(skeletonColor, other.skeletonColor, t),
      iconColor: Color.lerp(iconColor, other.iconColor, t),
      textColor: Color.lerp(textColor, other.textColor, t),
    );
  }

  static const colorSkelecton = CustomColors(
      backgroundSearchCard: Color(0xffeef3f8),
      skeletonColor: Color(0xfff3f2ef),
      iconColor: Color(0xff666666),
      textColor: Color(0xff666666));
}
