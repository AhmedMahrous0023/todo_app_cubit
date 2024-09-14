import 'package:flutter/material.dart';
import 'package:todo_app/Helper/app_localization.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final double fontSize, wordSpacing;
  final Color color;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  const TextWidget(
      {super.key,
      required this.text,
       this.fontSize=18,
       this.wordSpacing=0,
       this.color=Colors.black,
       this.fontWeight=FontWeight.normal,
       this.textAlign=TextAlign.start});

  @override
  Widget build(BuildContext context) {
    return Text(AppLocalization.of(context)!.translate(text),
        style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: color,
            wordSpacing: wordSpacing),
        textAlign: textAlign);
  }
}
