import 'package:flutter/material.dart';

class NavigateUsersWidgetAttend extends StatelessWidget {
  final String text;
  final VoidCallback onClickedPreviousAttend;
  final VoidCallback onClickedNextAttend;

  const NavigateUsersWidgetAttend({
    Key? key,
    required this.text,
    required this.onClickedPreviousAttend,
    required this.onClickedNextAttend,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            iconSize: 50,
            icon: Icon(Icons.navigate_before),
            onPressed: onClickedPreviousAttend,
          ),
          Text(
            text,
            style: TextStyle(fontSize: 24),
          ),
          IconButton(
            iconSize: 50,
            icon: Icon(Icons.navigate_next),
            onPressed: onClickedNextAttend,
          ),
        ],
      );
}
