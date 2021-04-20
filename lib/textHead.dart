import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class HandWrite extends StatelessWidget {
  @override
  String word;
  HandWrite(String word) {
    this.word = word;
  }
  Widget build(BuildContext context) {
    return AutoSizeText(
      word,
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
