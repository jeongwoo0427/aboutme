import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class UnknownScreen extends StatelessWidget {
  const UnknownScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Text('unknownPage')],
      ),
    );
  }
}
