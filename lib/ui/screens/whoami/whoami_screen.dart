import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app_router.dart';




class WhoAmIScreen extends StatefulWidget {
  const WhoAmIScreen({Key? key}) : super(key: key);

  static const String routeName = 'WhoAmI';

  @override
  State<WhoAmIScreen> createState() => _WhoAmIScreenState();
}

class _WhoAmIScreenState extends State<WhoAmIScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:  Center(child: Text('Who am I ?'),)
    );
  }
}
