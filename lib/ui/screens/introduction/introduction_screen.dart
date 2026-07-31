import 'package:aboutme/ui/screens/introduction/pages/cover_letter_page.dart';
import 'package:aboutme/ui/screens/introduction/pages/greeting_page.dart';
import 'package:aboutme/ui/screens/introduction/pages/history_page.dart';
import 'package:flutter/material.dart';

import '../../widgets/scaffold/responsive_glassy_scaffold.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({super.key});

  static const String routeName = 'WhoAmI';

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  ///스크롤 위치 변화로 3개 페이지 전체가 rebuild 되지 않도록,
  ///이 값을 쓰는 GreetingPage만 다시 그린다.
  final ValueNotifier<bool> _isTop = ValueNotifier<bool>(true);
  int _currentPage = 0;

  @override
  void dispose() {
    _isTop.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveGlassyScaffold(
      appbarTitle: const Text('Who am I ?'),
      onChangedPageState: (isTop) {
        _isTop.value = isTop;
      },
      onNotificationScroll: (notification) {
        final double pageRatio = notification.metrics.pixels / notification.metrics.maxScrollExtent;
        int page = 0;
        if (pageRatio <= 1 / 4) {
          page = 0;
        } else if (pageRatio > 1 / 4 && pageRatio <= 2 / 4) {
          page = 1;
        } else if (pageRatio > 2 / 4 && pageRatio <= 3 / 4) {
          page = 2;
        } else if (pageRatio > 3 / 4 && pageRatio <= 4 / 4) {
          page = 3;
        }

        //_currentPage는 build()에서 쓰이지 않으므로 setState 하지 않는다.
        if (_currentPage != page) {
          _currentPage = page;
          //print(page);
        }
      },
      body: SingleChildScrollView(
        child: Column(
          children: [
            ValueListenableBuilder<bool>(
              valueListenable: _isTop,
              builder: (context, isTop, _) => GreetingPage(showContinueText: isTop),
            ),
            CoverLetterPage(),
            const HistoryPage()
          ],
        ),
      ),
    );
  }
}
