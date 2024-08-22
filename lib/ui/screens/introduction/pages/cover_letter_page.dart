import 'package:aboutme/cores/extensions/build_context_extension.dart';
import 'package:aboutme/ui/widgets/boxes/max_width_box.dart';
import 'package:aboutme/ui/widgets/container/glassy_container.dart';
import 'package:aboutme/ui/widgets/scaffold/fitted_screen_size_body.dart';
import 'package:flutter/material.dart';

class CoverLetterPage extends StatefulWidget {
  CoverLetterPage({super.key});


  @override
  State<CoverLetterPage> createState() => _CoverLetterPageState();
}

class _CoverLetterPageState extends State<CoverLetterPage> {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FittedScreenSizeBody(
      body: Padding(
        padding: EdgeInsets.all(context.getResponsiveValue(70, 30)),
        child: Center(
          child: MaxWidthBox(
            child: GlassyContainer(
              height: double.infinity,
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MaxWidthBox(
                    maxWidth: 700,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircleAvatar(
                          minRadius: context.getResponsiveValue(60, 45),
                          backgroundColor: Colors.white24,
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Text('Name : Kim Jeong Woo'),
                            Text('Age : 26'),
                            Text('Job : Flutter software developer'),
                          ],)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
