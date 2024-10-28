class ProjectAttachmentGetDro {
  final int? no;
  final String uuid;
  final int? projectNo;
  final int? sequence;
  final String originalFilename;
  final DateTime? createdAt;

  ProjectAttachmentGetDro(
      {required this.no, required this.uuid, required this.projectNo, required this.sequence, required this.originalFilename, required this.createdAt});

  factory ProjectAttachmentGetDro.fromMap(Map<String,dynamic> map){
    return ProjectAttachmentGetDro(
      no: map['no'],
      uuid: map['uuid']??'unknown',
      projectNo: map['projectNo'],
      sequence: map['sequence'],
      originalFilename: map['originalFilename'],
      createdAt: map['createdAt'] == null ? null : DateTime.parse(map['createdAt'])
    );
  }
}
