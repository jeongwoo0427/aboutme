import 'package:aboutme/ui/screens/introduction/pages/cover_letter_page.dart';
import 'package:aboutme/ui/screens/introduction/pages/greeting_page.dart';
import 'package:aboutme/ui/screens/introduction/pages/history_page.dart';
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


  bool _isTop = true;
  int _currentPage = 0;


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
      onNotificationScroll: (notification){
        final double pageRatio = notification.metrics.pixels/notification.metrics.maxScrollExtent;
        int page = 0;
        if(pageRatio <= 1/4){
          page = 0;
        }else if(pageRatio > 1/4 && pageRatio <= 2/4 ){
          page = 1;
        }else if(pageRatio > 2/4 && pageRatio <= 3/4 ) {
          page = 2;
        }else if(pageRatio > 3/4 && pageRatio <= 4/4 ){
          page = 3;
        }

        if(_currentPage != page){
          setState(() {
            _currentPage = page;
            //print(page);
          });
        }


      },
      body: SingleChildScrollView(
        child: Column(
          children: [
            GreetingPage(showContinueText: _isTop,),
            CoverLetterPage(),
            HistoryPage()
          ],
        ),
      ),
    );
  }
}
