import 'package:flutter/material.dart';
import 'package:linkedin_scroll_animate_bottom_bar_and_appbar/src/core/core.dart';
import 'package:linkedin_scroll_animate_bottom_bar_and_appbar/src/core/custom_widget_shared/placeholder/placeholder_card_tall.dart';
import 'package:linkedin_scroll_animate_bottom_bar_and_appbar/src/core/custom_widget_shared/scaffold_linkedin.dart';

class HomeView extends StatelessWidget {
  HomeView({
    Key? key,
  }) : super(key: key);

  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColors>()!;

    return ScaffoldLinkedIn(children: [
      ...List.generate(
          3,
          ((index) => Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: PlaceholderCardTall(
                    height: MediaQuery.of(context).size.height / 2,
                    color: colors.skeletonColor,
                    backgroundColor: const Color(0xFFFFFFFF)),
              )))
    ]);
  }
}
