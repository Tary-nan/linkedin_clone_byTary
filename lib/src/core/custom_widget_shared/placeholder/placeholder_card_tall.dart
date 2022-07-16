import 'dart:math';

import 'package:flutter/material.dart';
import 'package:linkedin_scroll_animate_bottom_bar_and_appbar/src/core/styles/skeleton/custom_decoration.dart';

class PlaceholderCardTall extends StatelessWidget {
  final double? width;
  final double? height;
  final double cornerRadius;
  final Color? color;
  final Color? backgroundColor;

  const PlaceholderCardTall(
      {Key? key,
      this.cornerRadius = 4,
      this.color,
      this.backgroundColor,
      this.width = 400,
      this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final radius = Theme.of(context).extension<CustomDecoration>()!;

    var r = Random();
    var fgColor = color ?? const Color(0xfff2f2f2);
    double lineHeight = 14;
    return Container(
      width: width ?? double.infinity,
      height: height ?? double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(cornerRadius),
        color: backgroundColor ?? Colors.white,
      ),
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Stack(
        children: <Widget>[
          //Circle image
          Container(
            margin: const EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(999), color: fgColor),
            height: 45,
            width: 45,
          ),
          //Title
          Column(
            children: [
              Container(
                  margin: const EdgeInsets.only(left: 65, top: 7),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(999), color: fgColor),
                  height: lineHeight * .8,
                  width: 100.0 + r.nextInt(100)),
              Container(
                  margin: const EdgeInsets.only(left: 65, top: 7),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(999), color: fgColor),
                  height: lineHeight * .8,
                  width: 100.0 + r.nextInt(100)),
            ],
          ),

          //Content Line
          Container(
              margin: EdgeInsets.only(
                  left: 10, top: 60, right: 10.0 + r.nextInt(60)),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(999), color: fgColor),
              height: lineHeight * .8),

          //Content Line
          Container(
              margin: EdgeInsets.only(
                  left: 10, top: 80, right: 10.0 + r.nextInt(60)),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(999), color: fgColor),
              height: lineHeight * .8),

          //Content Line
          Container(
              margin: const EdgeInsets.only(
                top: 110,
              ),
              color: fgColor,
              height: MediaQuery.of(context).size.height / 4),

          // //Content Line
          Container(
              margin: EdgeInsets.only(
                  left: 5,
                  top: MediaQuery.of(context).size.height * .4 + 10,
                  right: 60.0 + r.nextInt(60)),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(999), color: fgColor),
              width: 10,
              height: lineHeight),
          Container(
              margin: EdgeInsets.only(
                  left: 20,
                  top: MediaQuery.of(context).size.height * .4 + 10,
                  right: 60.0 + r.nextInt(60)),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(999), color: fgColor),
              width: 10,
              height: lineHeight),
          Container(
              margin: EdgeInsets.only(
                  left: 35,
                  top: MediaQuery.of(context).size.height * .4 + 10,
                  right: 60.0 + r.nextInt(60)),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(999), color: fgColor),
              width: 10,
              height: lineHeight),
          Container(
              margin: EdgeInsets.only(
                  left: 50,
                  top: MediaQuery.of(context).size.height * .4 + 10,
                  right: 60.0 + r.nextInt(60)),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(999), color: fgColor),
              width: 60,
              height: lineHeight),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * .4 + 10,
                      right: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(999), color: fgColor),
                  width: 60,
                  height: lineHeight),
            ],
          ),
        ],
      ),
    );
  }
}
