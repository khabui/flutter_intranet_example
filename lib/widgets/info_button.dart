import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../resources/colors.dart';
import '../resources/text_theme.dart';
import 'horizontal_spacing.dart';

class InfoButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onPressed;

  static dynamic _dummyFunction() {}

  const InfoButton(
      {Key key,
      @required this.icon,
      @required this.text,
      this.onPressed = _dummyFunction})
      : assert(onPressed != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ButtonTheme(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        height: (text.length * 16) > (MediaQuery.of(context).size.width * 1.2)
            ? 64.0
            : 48.0,
        child: FlatButton(
          onPressed: onPressed,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: BorderSide(
              color: AppColors.greyColor300,
            ),
          ),
          child: Center(
            child: Row(
              children: <Widget>[
                Icon(
                  icon,
                  color: AppColors.whiteColor,
                  size: 20.0,
                ),
                const HorizontalSpacing(),
                Expanded(
                  child: Text(
                    text,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: textTheme(context).heading3.colorWhite,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
