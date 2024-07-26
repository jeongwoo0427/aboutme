import 'package:flutter/material.dart';

const double globalPaddingValue15 = 15;
const double globalPaddingValue25 = 25;

const EdgeInsets globalListPadding = EdgeInsets.only(top: 20,bottom: 60,left: globalPaddingValue15,right: globalPaddingValue15);

const Duration globalPageDuration = Duration(milliseconds: 300);
const Curve globalPageCurve = Curves.decelerate;


class MenuCodes{
  static const String BANNERMAKER = 'SPLTBM';
  static const String GAME = 'GAME';
  static const String CHAT = 'CHAT';
  static const String MULTIGAME = 'MTGM';
  static const String TEST = 'TEST';
}

enum ManageMode{
  read,
  create,
  edit
}


