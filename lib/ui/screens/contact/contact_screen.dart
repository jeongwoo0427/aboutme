import 'package:flutter/material.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({Key? key}) : super(key: key);

  static const routeName = 'ContactScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('Contact')));
  }
}
