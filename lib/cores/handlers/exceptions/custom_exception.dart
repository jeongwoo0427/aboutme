class CustomException implements Exception{
  String? title;
  String message;

  CustomException({this.title, required this.message});
}