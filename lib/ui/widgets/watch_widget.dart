import 'dart:async';

import 'package:aboutme/cores/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';

class WatchWidget extends StatefulWidget {
  const WatchWidget({super.key});

  @override
  State<WatchWidget> createState() => _WatchWidgetState();
}

class _WatchWidgetState extends State<WatchWidget> {
  late final Timer? _timer;
  DateTime _currentTime = DateTime.now();

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _currentTime = DateTime.now();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        _currentTime.toString().substring(11,19),
        style: TextStyle(
            fontWeight: FontWeight.w100,
            color: context.colorScheme.onSurface,
            fontSize: context.getResponsiveValue(35, 25)),
      ),
    );
  }


}
