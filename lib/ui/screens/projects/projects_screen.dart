import 'package:flutter/material.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({Key? key}) : super(key: key);

  static const routeName = 'ProjectsScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('Projects')));
  }
}
