import 'package:aboutme/ui/widgets/container/glassy_container.dart';
import 'package:flutter/material.dart';

class GlassyButton extends StatelessWidget {
  final Widget child;

  const GlassyButton({Key? key, required this.child, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlassyContainer(
      child: child,
    );
  }
}
