import 'package:flutter/material.dart';

class FormSectionTitle extends StatelessWidget {
  const FormSectionTitle(this.title, {Key? key}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 5.0,),
      child: Text(title,),
    );
  }
}
