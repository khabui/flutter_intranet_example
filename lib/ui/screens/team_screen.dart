import 'package:flutter/material.dart';

import '../../resources/text_theme.dart';

class TeamScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
