import 'package:aboutme/ui/screens/introduction/pages/cover_letter_page.dart';
import 'package:aboutme/ui/screens/introduction/pages/greeting_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app_router.dart';
import '../../widgets/scaffold/responsive_glassy_scaffold.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({Key? key}) : super(key: key);

  static const String routeName = 'WhoAmI';

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {


  late final GreetingPage _greetingPage = GreetingPage(showContinueText: _isTop,);
  late final CoverLetterPage _coverLetterPage = CoverLetterPage();

  bool _isTop = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveGlassyScaffold(
      appbarTitle: Text('Who am I ?'),
      onChangedPageState: (isTop) {
        setState(() {
          _isTop = isTop;
        });
      },
      body: SingleChildScrollView(
        child: Column(
          children: [
            _greetingPage,
            _coverLetterPage,
            _greetingPage,
            _greetingPage,
            _greetingPage,
            _coverLetterPage,
            _coverLetterPage,
          ],
        ),
      ),
    );
  }
}
