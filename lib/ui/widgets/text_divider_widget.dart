
import 'package:flutter/material.dart';

class TextDivider extends StatelessWidget {
  final String text;
  const TextDivider({super.key, required this.text });

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Divider(
            height: 1,
            thickness: 1,
            color: colorScheme.onBackground.withOpacity(0.4),
          ),
        ),
        SizedBox(width: 15,),
        Text(text,style: TextStyle(color: colorScheme.onBackground.withOpacity(0.7)),),
        SizedBox(width: 15,),
        Expanded(
          child: Divider(
            height: 1,
            thickness: 1,
            color: colorScheme.onBackground.withOpacity(0.4),
          ),
        )
      ],
    );
  }
}