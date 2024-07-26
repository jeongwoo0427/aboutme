// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
// final myProfileDataProvider = StateNotifierProvider<MyProfileDataNotifier,UserGetDRO?>((ref) {
//   return MyProfileDataNotifier();
// });
//
// class MyProfileDataNotifier extends StateNotifier<UserGetDRO?> {
//
//   MyProfileDataNotifier() : super(null);
//
//   final MeData _meData = MeData();
//
//   UserGetDRO? get myProfile => state;
//
//   ///Login버튼을 클릭할때만 마지막 순서에서 진행
//   Future<void> fetch() async{
//
//     state = await _meData.getMyUserData();
//   }
//
// }
