
import 'package:aboutme/cores/extensions/widget_ref_extension.dart';
import 'package:aboutme/ui/widgets/boxes/max_width_box.dart';
import 'package:aboutme/ui/widgets/container/glassy_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProjectDetailsWidget extends ConsumerWidget {
  const ProjectDetailsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isPotrait = MediaQuery.of(context).size.width < 1000;

    final Widget imageBox = MaxSizedBox(
      maxWidth: 600,
      child: Center(
        child: AspectRatio(
            aspectRatio: 5 / 3,
            child: GlassyContainer(
              child: Text(''),
            )),
      ),
    );

    final Widget detailBox = MaxSizedBox(
      maxWidth: 500,
      maxHeight: 400,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
          ),
          Expanded(
              flex: 3,
              child: Text(
                'hihiih',
                style: TextStyle(
                  fontSize: isPotrait ? 28 : 33, fontWeight: FontWeight.w700,),
              )),
          Expanded(
            flex: 8,
            child: Text(
              'yayayayayayay',
              style: TextStyle(
                  fontSize: isPotrait ?15:17, fontWeight: FontWeight.w300),
            ),
          ),
          Spacer(flex: 1,),
          Expanded(
            flex: 2,
            child: Row(children: [
              Text(
                '${ref.localizations.projects_details_project_date}: ',
                style: TextStyle(
                    fontSize: isPotrait ?15:17, fontWeight: FontWeight.w900),
              ),
              Text(
                '23.09 ~ 23.11',
                style: TextStyle(
                    fontSize: isPotrait ?15:17, fontWeight: FontWeight.w500),
              ),
            ],),
          ),
          Expanded(
              flex: 3,
              child:Row(children: [
                Text(
                  '${ref.localizations.projects_details_use_skills}: ',
                  style: TextStyle(
                      fontSize: isPotrait ?15:17, fontWeight: FontWeight.w900),
                ),
                Icon(Icons.gamepad)
              ],)
          ),

        ],
      ),
    );

    if (isPotrait) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Spacer(
            flex: 3,
          ),
          Expanded(
              flex: 5,
              child: Padding(padding: EdgeInsets.all(15), child: imageBox)),
          Expanded(
              flex: 7,
              child: Padding(padding: EdgeInsets.all(15), child: detailBox)),
          Spacer(
            flex: 4,
          )
        ],
      );
    } else {
      return Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Spacer(
            flex: 4,
          ),
          Expanded(flex: 6, child: imageBox),
          Spacer(flex: 1),
          Expanded(flex: 8, child: detailBox),
          Spacer(
            flex: 1,
          ),
        ],
      );
    }
  }
}