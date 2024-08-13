import 'package:flutter/material.dart';
import '../../widgets/scaffold/responsive_glassy_scaffold.dart';

class SkillsScreen extends StatefulWidget {
  const SkillsScreen({super.key});

  static const routeName = 'SkillsScreen';

  @override
  State<SkillsScreen> createState() => _SkillsScreenState();
}

class _SkillsScreenState extends State<SkillsScreen> {


  @override
  Widget build(BuildContext context) {
    return ResponsiveGlassyScaffold(
      appbarTitle: Text('Skills'),
      body: Text(''),
    );
  }
}
