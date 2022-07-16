// import 'package:flutter/material.dart';

// @immutable
// class CustomInputDecoration extends ThemeExtension<CustomInputDecoration> {
//   final InputDecoration? appInputDecora;

//   const CustomInputDecoration({
//     required this.appInputDecora,
//   });

//   @override
//   ThemeExtension<CustomInputDecoration> copyWith({
//     InputDecoration? appInputDecora,
//   }) {
//     return CustomInputDecoration(
//       appInputDecora: appInputDecora ?? this.appInputDecora,
//     );
//   }

//   @override
//   ThemeExtension<CustomInputDecoration> lerp(
//       ThemeExtension<CustomInputDecoration>? other, double t) {
//     if (other is! CustomInputDecoration) {
//       return this;
//     }
//     return CustomInputDecoration(
//       appInputDecora:
//           InputDecoration.collapsed(hintText: hintText),
//     );
//   }

//   static TextStyle helperStyle = const TextStyle(
//       fontSize: 15,
//       color: Colors.black,
//       letterSpacing: 0.5,
//       fontWeight: FontWeight.w500);

//   static final inputSearch = CustomInputDecoration(
//       appInputDecora: InputDecoration(
//     helperStyle: helperStyle,
//     filled: false,
//     fillColor: Colors.grey[50],
//     contentPadding: const EdgeInsets.symmetric(horizontal: 10),
//     focusedBorder:  const OutlineInputBorder(
//         borderSide: BorderSide(color: Color(0xff666666))),
//     errorBorder:
//         const OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
//     enabledBorder: const OutlineInputBorder(
//         borderSide: BorderSide(color: Colors.grey), gapPadding: 2.0),
//     border: const OutlineInputBorder(gapPadding: 2.0),
//     errorStyle: const TextStyle(color: Colors.transparent),
//     helperText: '',
//     hintText: '',
//     hintStyle: helperStyle,
//   ));
// }
