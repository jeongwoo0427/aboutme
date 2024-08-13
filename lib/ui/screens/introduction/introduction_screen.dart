import 'package:aboutme/ui/widgets/appbar/glassy_appbar.dart';
import 'package:aboutme/ui/widgets/constrained/max_width_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

import '../../../app_router.dart';
import '../../widgets/scaffold/responsive_glassy_scaffold.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({Key? key}) : super(key: key);

  static const String routeName = 'WhoAmI';

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveGlassyScaffold(
      appbarTitle: Text('Who am I ?'),
      body: Text('Preparing..'),
    );
  }
}
