import 'package:flutter/material.dart';

import '../../resources/text_theme.dart';

class MeetingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          alignment: Alignment.center,
          height: 300,
          width: 300,
          color: Colors.blue,
          child: Text(
            "Meeting",
            style: textTheme(context).bodyLarge.colorWhite,
          ),
        ),
      ),
    );
  }
}
