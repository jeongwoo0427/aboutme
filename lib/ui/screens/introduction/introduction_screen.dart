import 'package:aboutme/ui/screens/introduction/pages/cover_letter_page.dart';
import 'package:aboutme/ui/screens/introduction/pages/greeting_page.dart';
import 'package:flutter/material.dart';

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
      onChangedPageState: (isTop){

      },
      body: SingleChildScrollView(
        child: Column(
          children: [
            GreetingPage(),
            CoverLetterPage()
          ],
        ),
      ),
    );
  }
}
