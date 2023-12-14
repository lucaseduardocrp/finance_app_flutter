import 'package:flutter/material.dart';

class CustomListLinks extends StatelessWidget {
  final List<Text> children;
  final VoidCallback? onPressed;

  const CustomListLinks({
    Key? key,
    required this.children,
    this.onPressed,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: children,
      ),
    );
  }
}
