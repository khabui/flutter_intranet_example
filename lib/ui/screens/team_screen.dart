import 'package:flutter/material.dart';

import '../../resources/text_theme.dart';

class TeamScreen extends StatelessWidget {
  final String title;

  const TeamScreen({Key key, this.title}) : super(key: key);

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
          color: Colors.white,
          child: Text(
            "Team",
            style: textTheme(context).bodyLarge.colorBlack,
          ),
        ),
      ),
    );
  }
}
