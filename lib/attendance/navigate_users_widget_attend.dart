// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class NavigateUsersWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClickedPrevious;
  final VoidCallback onClickedNext;

  const NavigateUsersWidget({
    Key? key,
    required this.text,
    required this.onClickedPrevious,
    required this.onClickedNext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            iconSize: 50,
            icon: Icon(Icons.navigate_before),
            onPressed: onClickedPrevious,
          ),
          Text(
            text,
            style: TextStyle(fontSize: 24),
          ),
          IconButton(
            iconSize: 50,
            icon: Icon(Icons.navigate_next),
            onPressed: onClickedNext,
          ),
        ],
      );
}
