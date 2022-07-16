import 'package:flutter/material.dart';
import 'package:linkedin_scroll_animate_bottom_bar_and_appbar/src/features/home/views/components/clipped_view.dart';
import 'package:linkedin_scroll_animate_bottom_bar_and_appbar/src/features/home/views/components/navbar/navbar.dart';

class NavbarButton extends StatefulWidget {
  const NavbarButton(
    this.data,
   {
    required this.isSelected, 
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final NavBarItemData data;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  State<NavbarButton> createState() => _NavbarButtonState();
}

class _NavbarButtonState extends State<NavbarButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _iconAnimController;
  bool? _wasSelected;
  final double _animScale = 1;

  @override
  void initState() {
    //Create a tween + controller which will drive the icon rotation
    final duration = (350 / _animScale).round();
    _iconAnimController = AnimationController(
      duration: Duration(milliseconds: duration),
      vsync: this,
    );
    Tween<double>(begin: 0, end: 1).animate(_iconAnimController)
        //Listen for tween updates, and rebuild the widget tree on each tick
        .addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _startAnimIfSelectedChanged(widget.isSelected);
    //Create our main button, a Row, with an icon and some text
    //Inject the data from our widget.data property
    final content = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        //Rotate the icon using the current animation value
        Icon(
          widget.data.icon,
          size: 16,
          color: widget.isSelected ? Colors.blue : const Color(0xffcccccc),
        ),
        Text(
          widget.data.title,
          style: TextStyle(
            color: widget.isSelected ? Colors.blue : const Color(0xffcccccc),
            fontSize: 16
          ),
        )
      ],
    );

    //Wrap btn in GestureDetector so we can listen to taps
    return GestureDetector(
      onTap: () => widget.onTap(),
      //Wrap in a bit of extra padding to make it easier to tap
      child: Container(
        padding: const EdgeInsets.only(top: 16, bottom: 16, right: 4, left: 4),
        child: AnimatedContainer(
          alignment: Alignment.center,
          curve: Curves.easeOutCubic,
          duration: Duration(milliseconds: (700 / _animScale).round()),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(24)),
          ),
          child: ClippedView(
            child: content,
          ),
        ),
      ),
    );
  }

  void _startAnimIfSelectedChanged(bool isSelected) {
    if (_wasSelected != widget.isSelected) {
      //Go forward or reverse, depending on the isSelected state
      widget.isSelected
          ? _iconAnimController.forward()
          : _iconAnimController.reverse();
    }
    _wasSelected = widget.isSelected;
  }
}
