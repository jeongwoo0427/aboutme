import 'package:flutter/material.dart';

class LabelLayout extends StatelessWidget {

  final String label;
  final Widget child;

  const LabelLayout({Key? key, required this.label,required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(

        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
            ),
          ),
          Expanded(flex: 1, child: SizedBox()),
          Expanded(
              flex: 10,
              child: child),
        ],
      ),
    );
  }
}
