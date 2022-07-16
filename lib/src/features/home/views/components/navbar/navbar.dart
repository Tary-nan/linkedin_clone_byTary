import 'package:flutter/material.dart';
import 'package:linkedin_scroll_animate_bottom_bar_and_appbar/src/features/home/views/components/navbar/navbar_button.dart';

class NavBar extends StatelessWidget {
  const NavBar({
    Key? key,
    required this.items,
    required this.itemTapped,
    this.currentIndex = 0,
  }) : super(key: key);

  final ValueChanged<int> itemTapped;
  final int currentIndex;
  final List<NavBarItemData> items;

  NavBarItemData? get selectedItem =>
      currentIndex >= 0 && currentIndex < items.length
          ? items[currentIndex]
          : null;

  @override
  Widget build(BuildContext context) {
    final List<Widget> buttonWidgets = items.map((data) {
      return NavbarButton(
        data,
        isSelected: data == selectedItem,
        onTap: () {
          final index = items.indexOf(data);
          itemTapped(index);
        },
      );
    }).toList();

    //Create a container with a row, and add our btn widgets into the row
    return Container(
      // padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: const Color(0xffffffff).withOpacity(.9),
        boxShadow: [
          BoxShadow(blurRadius: 16, color: Colors.black.withOpacity(.1)),
          BoxShadow(blurRadius: 24, color: Colors.black.withOpacity(.1)),
        ],
      ),
      // alignment: Alignment.center,
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: buttonWidgets,
      ),
    );
  }
}

class NavBarItemData {
  const NavBarItemData(this.title, this.icon, this.width, this.selectedColor);
  final String title;
  final IconData icon;
  final Color selectedColor;
  final double width;
}
