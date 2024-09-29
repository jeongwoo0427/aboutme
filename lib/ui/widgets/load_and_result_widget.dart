import 'dart:async';

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

enum _ProgressState { show, finish, reset }

class LoadAndResultWidgetController with ChangeNotifier {
  final _controller = StreamController<_ProgressState>();
  late final Stream<_ProgressState> _progressStateStream =
      _controller.stream.asBroadcastStream();

  Stream<_ProgressState> get progressStateStream => _progressStateStream;

  IconData _resultIcon = Icons.check;
  IconData get resultIcon => _resultIcon;

  String _resultText = 'Success!';
  String get resultText => _resultText;



  void show() {
    _controller.sink.add(_ProgressState.show);
  }

  void reset() {
    _controller.sink.add(_ProgressState.reset);
  }

  void success() {
    _resultIcon = Icons.check;
    _resultText = 'Success!';
    notifyListeners();
    _controller.sink.add(_ProgressState.finish);
  }

  void failed() {
    _resultIcon = Icons.error_outline;
    _resultText = 'Failed';
    notifyListeners();
    _controller.sink.add(_ProgressState.finish);
  }
}

class LoadAndResultWidget extends StatefulWidget {
  final LoadAndResultWidgetController controller;

  const LoadAndResultWidget({Key? key, required this.controller})
      : super(key: key);

  @override
  State<LoadAndResultWidget> createState() => _LoadAndResultWidgetState();
}

class _LoadAndResultWidgetState extends State<LoadAndResultWidget>
    with TickerProviderStateMixin {
  late final AnimationController _stackAnimationController;
  late final Animation<double> _stackAnimation;

  late final AnimationController _hideIndicatorAnimationController;
  late final Animation<double> _hideIndicatorAnimation;

  late final AnimationController _showCheckIconAnimationController;
  late final Animation<double> _showCheckIconAnimation;

  late final AnimationController _showMessageAnimationController;
  late final Animation<double> _showMessageAnimation;

  @override
  void dispose() {
    _stackAnimationController.dispose();
    _hideIndicatorAnimationController.dispose();
    _showCheckIconAnimationController.dispose();
    _showMessageAnimationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _fetchAnimations();
    widget.controller.progressStateStream.listen((state) async {
      if (state == _ProgressState.show) {
        _stackAnimationController.forward();
      }

      if (state == _ProgressState.reset) {
        await _stackAnimationController.reverse();
        _hideIndicatorAnimationController.reset();
        _showCheckIconAnimationController.reset();
        _showMessageAnimationController.reset();
      }

      if (state == _ProgressState.finish) {
        await _hideIndicatorAnimationController.forward();
        await _showCheckIconAnimationController.forward();
        await _showMessageAnimationController.forward();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: widget.controller,
        builder: (context, child) {
          return SizedBox(
            height: 300,
            width: 300,
            child: AnimatedBuilder(
              animation: _stackAnimation,
              builder: (context, child) {
                return Transform.scale(
                  scale: _stackAnimation.value,
                  child: child,
                );
              },
              child: AnimatedBuilder(
                animation: _showMessageAnimation,
                builder: (context, child) {
                  return Stack(
                    children: [
                      Positioned(
                        top: _showMessageAnimation.value*(-50),
                        left: 0,
                        bottom: 0,
                        right: 0,
                        child: AnimatedBuilder(
                            animation: _showCheckIconAnimation,
                            builder: (context, child) {
                              return Transform.scale(
                                  scale: _showCheckIconAnimation.value,
                                  child: child);
                            },
                            child: Icon(
                              widget.controller.resultIcon,
                              size: 50,
                            )),
                      ),

                      Positioned(
                        top: _showMessageAnimation.value*(50),
                        left: 0,
                        bottom: 0,
                        right: 0,
                        child: Center(
                          child: Opacity(
                            opacity: _showMessageAnimation.value,
                            child: Text(widget.controller.resultText,style: TextStyle(
                              fontSize: 20,

                            ),),
                          ),
                        ),
                      ),
                      Positioned.fill(
                          child: AnimatedBuilder(
                        animation: _hideIndicatorAnimation,
                        builder: (context, child) {
                          return Transform.scale(
                            scale: _hideIndicatorAnimation.value,
                            child: child,
                          );
                        },
                        child: LoadingAnimationWidget.fourRotatingDots(
                            color: Colors.white, size: 50),
                      ))
                    ],
                  );
                },
              ),
            ),
          );
        });
  }

  void _fetchAnimations() {
    _stackAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _stackAnimation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _stackAnimationController,
      curve: Curves.ease,
    ));

    _hideIndicatorAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _hideIndicatorAnimation =
        Tween<double>(begin: 1, end: 0).animate(CurvedAnimation(
      parent: _hideIndicatorAnimationController,
      curve: Curves.ease,
    ));

    _showCheckIconAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _showCheckIconAnimation =
        Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _showCheckIconAnimationController,
      curve: Curves.elasticOut,
    ));

    _showMessageAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _showMessageAnimation =
        Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _showMessageAnimationController,
      curve: Curves.ease,
    ));
  }
}
