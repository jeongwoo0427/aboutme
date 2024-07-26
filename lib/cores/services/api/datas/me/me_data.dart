// import '../../api_service.dart';
//
//
// class MeData{
//   Future<UserGetDRO> getMyUserData() async{
//     final String pathString = '/v1/me/user';
//     final data = await APIService().request(pathString, method: 'GET',);
//     final UserGetDRO result = UserGetDRO.fromMap(data);
//     return result;
//   }
//
//
//   Future<QuizGetDRO> createMyQuiz(
//       {required String userUUID,
//         required String title,
//         required String description,
//         required DateTime? startAt,
//         required DateTime? endAt,
//         required int? limitMs,
//         required String tags,
//         required int questionCount,
//         required int isPublic,
//         required String updatedIP}) async {
//     final String pathString = '/v1/me/quizzes';
//     final data = await APIService().request(pathString,method: 'POST',data: {
//       'userUUID' : userUUID,
//       'title' : title,
//       'description' : description,
//       'startAt' : startAt,
//       'endAt' : endAt,
//       'limitMs' : limitMs,
//       'tags' : tags,
//       'questionCount' : questionCount,
//       'isPublic' : isPublic,
//       'updatedIP' : updatedIP
//     });
//     return QuizGetDRO.fromMap(data);
//   }
//
//   Future<List<QuizGetDRO>> searchMyQuizzes({required int limit, required int offset, required String title}) async{
//     final String pathString = '/v1/me/quizzes?limit=${limit}&offset=${offset}&title=${title}';
//     final data = await APIService().request(pathString,method: 'GET');
//     final List<QuizGetDRO> quizzes = [];
//     for(int i = 0; i < data.length; i++){
//       quizzes.add(QuizGetDRO.fromMap(data[i]));
//     }
//     await Future.delayed(Duration(milliseconds: 100)); //연속 호출로 인한 부하 방지
//     return quizzes;
//   }
//
//
//
// }