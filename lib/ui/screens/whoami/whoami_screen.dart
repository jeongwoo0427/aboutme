import 'package:aboutme/ui/widgets/appbar/glassy_appbar.dart';
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
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: 1000,
                  ),
                  child: GlassyAppbar(
                    title: Text('Who am I ?'),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
