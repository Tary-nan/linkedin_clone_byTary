import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:linkedin_scroll_animate_bottom_bar_and_appbar/src/core/core.dart';
import 'package:linkedin_scroll_animate_bottom_bar_and_appbar/src/features/home/logic/logic.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_view.dart';

class OverView extends StatelessWidget {
  const OverView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        // Fixing the status bar icon color
        statusBarIconBrightness:
            Theme.of(context).brightness == Brightness.light
                ? Brightness.dark
                : Brightness.light,
        statusBarColor: Colors.transparent,
      ),
      child: BlocProvider(
        create: (context) => HomeCubit(),
        child: ScaffoldApp(),
      ),
    );
  }
}

class ScaffoldApp extends StatelessWidget {
  ScaffoldApp({
    Key? key,
  }) : super(key: key);

  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    final selectedTab = context.select((HomeCubit cubit) => cubit.state.tab);
    final colors = Theme.of(context).extension<CustomColors>()!;

    return Scaffold(
      backgroundColor: colors.skeletonColor,
      body: IndexedStack(
        index: selectedTab.index,
        children: [HomeView(), HomeView(), HomeView(), HomeView(), HomeView()],
      ),
    );
  }
}
