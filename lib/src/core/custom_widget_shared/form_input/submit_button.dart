import 'package:flutter/material.dart';

/// 1 - colore primary
///
///
///

class SubmitButton extends StatelessWidget {


  const SubmitButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.isErrorVisible = false,
  }) : super(key: key);

    final Widget child;
  final Function()? onPressed;
  final bool isErrorVisible;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          RawMaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            elevation: 0,
            // fillColor: Style.primaryColor,
            onPressed: onPressed,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                    child: Container(
                      height: 48,
                      decoration: BoxDecoration(
                          color: const Color(0xffC9420A),
                          borderRadius: BorderRadius.circular(4)),
                    ),
                  ),
                child,
              ],
            ),
          ),
          if (isErrorVisible)
            const Padding(
                padding:  EdgeInsets.only(top: 6.0),
                child: Text('Remplisser tout les champs',
                    style: TextStyle(color: Colors.red)))
        ],
      ),
    );
  }
}
