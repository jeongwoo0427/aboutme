class ProjectDetailGetDro {
  final int no;
  final int projectNo;
  final String language;
  final String title;
  final String detail;
  final DateTime createdAt;
  final DateTime? updatedAt;

  ProjectDetailGetDro(
      {required this.no,
      required this.projectNo,
      required this.language,
      required this.title,
      required this.detail,
      required this.createdAt,
      required this.updatedAt});

  factory ProjectDetailGetDro.fromMap(Map<String, dynamic> map) {
    return ProjectDetailGetDro(
        no: map['no'],
        projectNo: map['projectNo'],
        language: map['language'],
        title: map['title'],
        detail: map['detail'],
        createdAt: DateTime.parse(map['createdAt']),
        updatedAt: map['updatedAt'] == null ? null : DateTime.parse(map['updatedAt']));
  }

}
