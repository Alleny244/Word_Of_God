import 'package:flutter/material.dart';

class SwitchTheme extends StatelessWidget {
  static const MaterialColor kPrimaryColor = const MaterialColor(
    0xFFB22222,
    const <int, Color>{
      50: const Color(0xFFB22222),
      100: const Color(0xFFB22222),
      200: const Color(0xFFB22222),
      300: const Color(0xFFB22222),
      400: const Color(0xFFB22222),
      500: const Color(0xFFB22222),
      600: const Color(0xFFB22222),
      700: const Color(0xFFB22222),
      800: const Color(0xFFB22222),
      900: const Color(0xFFB22222),
    },
  );

  bool value;
  SwitchTheme(bool value) {
    this.value = value;
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
