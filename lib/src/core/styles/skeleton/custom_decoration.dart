import 'package:flutter/material.dart';

@immutable
class CustomDecoration extends ThemeExtension<CustomDecoration> {
  final Decoration? cornerRadius;

  const CustomDecoration({
    required this.cornerRadius,
  });

  @override
  ThemeExtension<CustomDecoration> copyWith({
    Decoration? cornerRadius,
  }) {
    return CustomDecoration(
      cornerRadius: cornerRadius ?? this.cornerRadius,
    );
  }

  @override
  ThemeExtension<CustomDecoration> lerp(
      ThemeExtension<CustomDecoration>? other, double t) {
    if (other is! CustomDecoration) {
      return this;
    }
    return CustomDecoration(
      cornerRadius: Decoration.lerp(cornerRadius, other.cornerRadius, t),
    );
  }

  static final decoSkeleton = CustomDecoration(
      cornerRadius: BoxDecoration(borderRadius: BorderRadius.circular(999)));
}
