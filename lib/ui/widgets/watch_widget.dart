import 'dart:async';

import 'package:aboutme/cores/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WatchWidget extends StatefulWidget {
  const WatchWidget({super.key});

  @override
  State<WatchWidget> createState() => _WatchWidgetState();
}

class _WatchWidgetState extends State<WatchWidget> {
  static final DateFormat _timeFormat = DateFormat('HH:mm:ss');

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
    //1초마다 다시 그려지므로 배경(지구본)과 같은 레이어를 쓰지 않도록 분리한다.
    return RepaintBoundary(
      child: Center(
        child: Text(
          _timeFormat.format(_currentTime),
          style: TextStyle(
              fontWeight: FontWeight.w100,
              color: context.colorScheme.onSurface,
              fontSize: context.getResponsiveValue(35, 25)),
        ),
      ),
    );
  }


}
