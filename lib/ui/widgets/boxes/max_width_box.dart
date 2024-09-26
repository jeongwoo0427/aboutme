import 'package:flutter/material.dart';

class MaxSizedBox extends StatelessWidget {
  const MaxSizedBox({super.key, required this.child, this.maxWidth = 1000,this.maxHeight = 1000});

  final Widget child;
  final double maxWidth;
  final double maxHeight;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: maxWidth,
          maxHeight: maxHeight,
        ),
        child: child,
      ),
    );
  }
}
