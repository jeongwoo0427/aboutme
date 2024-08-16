import 'package:aboutme/ui/widgets/container/glassy_container.dart';
import 'package:flutter/material.dart';

class GlassySelector extends StatelessWidget {
  int selectedIndex;
  List<GlassySelectorItem> items;
  final width;

  GlassySelector({super.key, required this.selectedIndex, required this.items, this.width = 100});

  @override
  Widget build(BuildContext context) {
    return GlassyContainer(
      width: width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: DropdownButtonFormField(
          focusColor: Colors.transparent,
          decoration: InputDecoration(
            fillColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            focusedBorder: InputBorder.none,
            border: InputBorder.none,
            filled: false,
          ),
          onChanged: (String? value) {},
          items: [
            DropdownMenuItem(
              value: 'hi',
              child: Text('hi'),
            )
          ],
        ),
      ),
    );
  }
}

class GlassySelectorItem {}
