import 'package:aboutme/ui/widgets/scaffold/responsive_glassy_scaffold.dart';
import 'package:flutter/material.dart';

import '../../widgets/appbar/glassy_appbar.dart';
import '../../widgets/constrained/max_width_box.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);

  static const routeName = 'ContactScreen';

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {


  @override
  Widget build(BuildContext context) {
    return ResponsiveGlassyScaffold(
      appbarTitle: Text('Contact'),
      body: Text(''),
    );
  }
}
