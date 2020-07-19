import 'package:flutter/material.dart';

import '../../resources/text_theme.dart';

class MeetingScreen extends StatelessWidget {
  final String title;

  const MeetingScreen({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          title,
          style: textTheme(context).heading2.colorWhite,
        ),
      ),
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
