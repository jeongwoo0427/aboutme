import 'package:aboutme/cores/extensions/build_context_extension.dart';
import 'package:aboutme/ui/widgets/boxes/max_width_box.dart';
import 'package:aboutme/ui/widgets/container/glassy_container.dart';
import 'package:aboutme/ui/widgets/scaffold/fitted_screen_size_body.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {

    final TextStyle profileStateTextStyle = TextStyle(
        fontSize: context.getResponsiveValue(18, 14),
        fontWeight: FontWeight.w300,
        color: context.colorScheme.onSurface);

    return FittedScreenSizeBody(body: Column(
      children: [
        GlassyContainer(
          height: context.getResponsiveValue(200, 150),
          width: context.getResponsiveValue(500, 400),
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          child: MaxWidthBox(
            maxWidth: 700,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  minRadius: context.getResponsiveValue(60, 45),
                  backgroundColor: Colors.white24,
                ),
                DefaultTextStyle(
                  style: profileStateTextStyle,
                  child: const Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Name : Kim Jeong Woo'),
                      SizedBox(
                        height: 12,
                      ),
                      Text('Age : 26'),
                      SizedBox(
                        height: 12,
                      ),
                      Text('Job : Flutter software developer'),
                    ],
                  ),
                )
              ],
            ),
          ),
        )

      ],
    ));
  }
}
