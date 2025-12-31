import 'package:aboutme/ui/widgets/scaffold/responsive_glassy_scaffold.dart';
import 'package:flutter/material.dart';

class ProjectsManageScreen extends StatefulWidget {
  static const String routeName = 'ProjectsManageScreen';

  const ProjectsManageScreen({super.key});

  @override
  State<ProjectsManageScreen> createState() => _ProjectsManageScreenState();
}

class _ProjectsManageScreenState extends State<ProjectsManageScreen> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveGlassyScaffold(
      appbarTitle: const Text('Manage Projects'),
      body: Container(),
    );
  }
}
