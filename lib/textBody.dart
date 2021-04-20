import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class BodyWrite extends StatelessWidget {
  @override
  String word;
  BodyWrite(String word) {
    this.word = word;
  }
  Widget build(BuildContext context) {
    return AutoSizeText(
      word,
      style: TextStyle(
        fontSize: 15,
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
