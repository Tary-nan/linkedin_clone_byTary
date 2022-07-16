import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:linkedin_scroll_animate_bottom_bar_and_appbar/src/core/core.dart';
import 'package:linkedin_scroll_animate_bottom_bar_and_appbar/src/features/home/logic/logic.dart';
import 'package:linkedin_scroll_animate_bottom_bar_and_appbar/src/features/home/views/components/animated_bottom_navigation_bar.dart';

import '../../features/home/models/states/state.dart';

class ScaffoldLinkedIn extends StatefulWidget {
  const ScaffoldLinkedIn({Key? key, required this.children}) : super(key: key);

  final List<Widget> children;

  @override
  State<ScaffoldLinkedIn> createState() => _ScaffoldLinkedInState();
}

class _ScaffoldLinkedInState extends State<ScaffoldLinkedIn> {
  final GlobalKey<State<StatefulWidget>> _globalkey = GlobalKey();

  final ScrollController controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    final selectedTab = context.select((HomeCubit cubit) => cubit.state.tab);

    final colors = Theme.of(context).extension<CustomColors>()!;

    return Stack(children: [
      CustomScrollView(
        controller: controller,
        slivers: [
          SliverAppBar(
            elevation: 0,
            leadingWidth: 40,
            leading: Container(
              margin: const EdgeInsets.only(left: 10, top: 5),
              child: const CircleAvatar(
                child: FaIcon(FontAwesomeIcons.faceFrownOpen),
              ),
            ),
            actions: const [
              Padding(
                padding: EdgeInsets.only(
                  right: 20,
                  top: 15,
                ),
                child: FaIcon(FontAwesomeIcons.message),
              )
            ],
            systemOverlayStyle:
                const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
            title: SizedBox(
              height: 45,
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Rechercher",
                  filled: true,
                  fillColor: colors.backgroundSearchCard,
                  prefixIcon: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.search,
                        size: 25,
                      )
                    ],
                  ),
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(3)),
                      borderSide:
                          BorderSide(width: 0, color: Colors.transparent)),
                  focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(3)),
                      borderSide:
                          BorderSide(width: 0, color: Colors.transparent)),
                  enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(3)),
                      borderSide:
                          BorderSide(width: 0, color: Colors.transparent)),
                  hintStyle: const TextStyle(fontSize: 14),
                  isDense: true,
                  contentPadding: const EdgeInsets.only(
                      left: 10, top: 11, right: 8, bottom: 11),
                  suffixIconConstraints:
                      const BoxConstraints(maxHeight: 28, maxWidth: 44),
                ),
                style: const TextStyle(
                  color: Colors.black,
                ),
                cursorColor: Colors.blue,
              ),
            ),
            floating: true,
            backgroundColor: Colors.white,
            shadowColor: Colors.transparent,
          ),
          SliverToBoxAdapter(
            child: Column(
              children: widget.children,
            ),
          )
        ],
      ),
      AnimatedBottomNavigationBar(
        controller: controller,
        child: Container(
          key: _globalkey,
          child: Container(
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: _HomeTabButton(
                    groupValue: selectedTab,
                    value: HomeTab.home,
                    icon: Icons.home,
                  ),
                ),
                Expanded(
                  child: _HomeTabButton(
                    groupValue: selectedTab,
                    value: HomeTab.networks,
                    icon: Icons.groups_rounded,
                  ),
                ),
                Expanded(
                  child: _HomeTabButton(
                      groupValue: selectedTab,
                      value: HomeTab.posts,
                      icon: Icons.add),
                ),
                Expanded(
                  child: _HomeTabButton(
                    groupValue: selectedTab,
                    value: HomeTab.notifications,
                    icon: Icons.notification_add_rounded,
                  ),
                ),
                Expanded(
                  child: _HomeTabButton(
                    groupValue: selectedTab,
                    value: HomeTab.jobs,
                    icon: Icons.work_rounded,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ]);
  }
}

class _HomeTabButton extends StatelessWidget {
  const _HomeTabButton({
    Key? key,
    required this.groupValue,
    required this.value,
    required this.icon,
  }) : super(key: key);

  final HomeTab groupValue;
  final HomeTab value;
  final IconData icon;

  String getName(HomeTab tab) {
    switch (tab) {
      case HomeTab.home:
        return 'Acceuil';
      case HomeTab.networks:
        return 'Mon reseau';
      case HomeTab.posts:
        return 'Post';
      case HomeTab.notifications:
        return 'Notifications';
      case HomeTab.jobs:
        return 'Emplois';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColors>()!;

    return Material(
      child: InkWell(
        onTap: () => context.read<HomeCubit>().setTab(value),
        child: Ink(
          color: Colors.white,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: groupValue != value
                        ? Colors.transparent
                        : Theme.of(context).colorScheme.secondary,
                    width: 2.0,
                  ),
                ),
              ),
              child: Column(
                children: [
                  (HomeTab.posts == value)
                      ? Container(
                          margin: const EdgeInsets.symmetric(horizontal: 25),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: colors.iconColor,
                              borderRadius: BorderRadius.circular(5)),
                          child: Icon(
                            icon,
                            color: Colors.white,
                          ))
                      : Icon(
                          icon,
                          color: groupValue != value
                              ? null
                              : Theme.of(context).colorScheme.secondary,
                        ),
                  Text(
                    getName(value),
                    style: const TextStyle(fontSize: 13),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
