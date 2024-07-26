import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final mainMenuPageControllerProvider = ChangeNotifierProvider((ref) {
  return MainMenuPageControllerNotifier();
});

class MainMenuPageControllerNotifier extends ChangeNotifier {
  MainMenuPageControllerNotifier();

  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  int get currentPage => _currentPage;

  PageController get pageController => _pageController;

  void jumpToPage(int page) {
    if (page == _currentPage) {
      return;
    }
    _pageController.jumpToPage(page);
    _currentPage = page;
    notifyListeners();
  }
}
