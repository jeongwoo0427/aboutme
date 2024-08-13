import 'package:aboutme/cores/extensions/build_context_extension.dart';
import 'package:aboutme/ui/widgets/container/glassy_container.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class GlassyAppbar extends StatelessWidget implements PreferredSizeWidget {

  final Widget? title;

  const GlassyAppbar({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: GlassyContainer(
        height: 60,
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Stack(
          children: [
            Positioned(
              left: 0, top: 0, bottom: 0,
              child: Center(
                child: IconButton(icon: Icon(Icons.arrow_left), iconSize: context.getResponsiveValue<double>(35,30), onPressed: () {
                  Navigator.of(context).pop();
                },),
              ),),
            Positioned(
              left: 0,right: 0, top: 0, bottom: 0,
              child: Center(
                child: DefaultTextStyle(
                    style: TextStyle(fontSize: context.getResponsiveValue<double>(20,16),fontWeight: FontWeight.w700,color: context.colorScheme.onSurface),
                    child: title??Text('')),
              ),)


          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 20);
}