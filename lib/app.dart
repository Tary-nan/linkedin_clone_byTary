import 'package:flutter/material.dart';
import 'package:linkedin_scroll_animate_bottom_bar_and_appbar/src/core/core.dart';
import 'package:linkedin_scroll_animate_bottom_bar_and_appbar/src/core/styles/skeleton/custom_decoration.dart';
import 'package:linkedin_scroll_animate_bottom_bar_and_appbar/src/features/home/views/over_view.dart';

class LinkedInAnimatedBottomApp extends StatelessWidget {
  const LinkedInAnimatedBottomApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const OverView(),
      themeMode: ThemeMode.light,
      theme: ThemeData.light().copyWith(
        useMaterial3: true,
        primaryColor: Colors.blue,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        extensions: <ThemeExtension<dynamic>>[
          CustomColors.colorSkelecton,
          CustomDecoration.decoSkeleton,
        ],
      ),
    );
  }
}
