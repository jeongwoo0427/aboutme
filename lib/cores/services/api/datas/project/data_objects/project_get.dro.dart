import 'package:aboutme/cores/services/api/datas/project/data_objects/project_attachment_get.dro.dart';
import 'package:aboutme/cores/services/api/datas/project/data_objects/project_detail_get.dro.dart';

class ProjectGetDro {
  final int no;
  final String projectCode;
  final DateTime periodStart;
  final DateTime periodEnd;
  final String skills;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final List<ProjectDetailGetDro> details;
  final List<ProjectAttachmentGetDro> attachments;

  ProjectGetDro(
      {required this.no,
      required this.projectCode,
      required this.periodStart,
      required this.periodEnd,
      required this.skills,
      required this.createdAt,
      required this.updatedAt,
      required this.details,
      required this.attachments});

  factory ProjectGetDro.fromMap(Map<String, dynamic> map) {
    final List<ProjectDetailGetDro> details = [];
    final List<ProjectAttachmentGetDro> attachments = [];
    for (int i = 0; i < map['details'].length; i++) {
      details.add(ProjectDetailGetDro.fromMap(map['details'][i]));
    }

    for (int i = 0; i < map['attachments'].length; i++) {
      attachments.add(ProjectAttachmentGetDro.fromMap(map['attachments'][i]));
    }
    return ProjectGetDro(
      no: map['no'],
      projectCode: map['projectCode'],
      periodStart: DateTime.parse(map['periodStart']),
      periodEnd: DateTime.parse(map['periodEnd']),
      skills: map['skills'],
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: map['updatedAt'] == null ? null : DateTime.parse(map['updatedAt']),
      details: details,
      attachments: attachments
    );
  }
}
