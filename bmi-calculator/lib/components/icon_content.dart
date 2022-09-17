import 'package:flutter/material.dart';

import '../constants.dart';

class ReusableIcon extends StatelessWidget {
  final String iconText;
  final IconData icon;
  ReusableIcon(this.iconText, this.icon);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(
          iconText,
          style: kLabeltextStye,
        )
      ],
    );
  }
}
