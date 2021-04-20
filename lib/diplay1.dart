import 'package:flutter/material.dart';

import 'package:wordofgod/textBody.dart';
import 'package:wordofgod/textHead.dart';

class Display1 extends StatelessWidget {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    return Container(
      child: Scaffold(
        appBar: AppBar(),
        body: Container(
          padding: EdgeInsets.fromLTRB(14, 0, 8, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HandWrite(
                data['wording'],
              ),
              SizedBox(
                height: 30,
              ),
              BodyWrite(data['para']),
            ],
          ),
        ),
      ),
    );
  }
}
