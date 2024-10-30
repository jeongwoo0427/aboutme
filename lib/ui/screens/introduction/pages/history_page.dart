import 'dart:html' as html;

import 'package:aboutme/constants/app_assets.dart';
import 'package:aboutme/cores/extensions/build_context_extension.dart';
import 'package:aboutme/ui/widgets/boxes/max_width_box.dart';
import 'package:aboutme/ui/widgets/container/glassy_container.dart';
import 'package:aboutme/ui/widgets/scaffold/fitted_screen_size_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    final TextStyle profileStateTextStyle =
        TextStyle(fontSize: context.getResponsiveValue(18, 14), fontWeight: FontWeight.w300, color: context.colorScheme.onSurface);

    return FittedScreenSizeBody(
        body: Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GlassyContainer(
          height: context.getResponsiveValue(200, 150),
          width: context.getResponsiveValue(500, 400),
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          child: MaxSizedBox(
            maxWidth: 700,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  minRadius: context.getResponsiveValue(60, 45),
                  backgroundColor: Colors.white24,
                  child: Icon(
                    Icons.person,
                    color: context.colorScheme.onSurface.withOpacity(0.7),
                    size: context.getResponsiveValue(80, 50),
                  ),
                ),
                DefaultTextStyle(
                  style: profileStateTextStyle,
                  child: const Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(TextSpan(children: [TextSpan(text: 'Name: ', style: TextStyle(fontWeight: FontWeight.w900)), TextSpan(text: 'Kim Jeong Woo')])),
                      SizedBox(
                        height: 12,
                      ),
                      Text.rich(TextSpan(children: [TextSpan(text: 'Birth: ', style: TextStyle(fontWeight: FontWeight.w900)), TextSpan(text: '1998. 04')])),
                      SizedBox(
                        height: 12,
                      ),
                      Text.rich(
                          TextSpan(children: [TextSpan(text: 'Job: ', style: TextStyle(fontWeight: FontWeight.w900)), TextSpan(text: 'Software Engineer')])),
                      SizedBox(
                        height: 12,
                      ),
                      Text.rich(TextSpan(children: [TextSpan(text: 'Area: ', style: TextStyle(fontWeight: FontWeight.w900)), TextSpan(text: 'Seoul')])),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(height: 50),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: (){
                html.window.open('https://cajava.tistory.com', 'jw_tistory');
              },
              child: SizedBox(
                height: 50,
                width: 50,
                child: SvgPicture.asset(
                  AppAssets.SVG_TISTORY,
                  colorFilter: ColorFilter.mode(context.colorScheme.onSurface, BlendMode.srcIn),
                ),
              ),
            ),
            SizedBox(width: 50),
            GestureDetector(
              onTap: (){
                html.window.open('https://github.com/jeongwoo0427', 'jw_github');
              },
              child: SizedBox(
                height: 50,
                width: 50,
                child: SvgPicture.asset(
                  AppAssets.SVG_GITHUB,
                  colorFilter: ColorFilter.mode(context.colorScheme.onSurface, BlendMode.srcIn),
                ),
              ),
            )
          ],
        )
      ],
    ));
  }
}
