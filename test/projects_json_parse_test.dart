import 'dart:convert';
import 'dart:io';

import 'package:aboutme/constants/app_constants.dart';
import 'package:aboutme/cores/services/api/datas/project/data_objects/project_get.dro.dart';
import 'package:aboutme/cores/utils/language_utility.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('projects.json 의 모든 항목이 ProjectGetDro 로 파싱되고 3개 언어를 갖는다', () {
    final data = jsonDecode(File('assets/jsons/projects.json').readAsStringSync()) as List<dynamic>;
    final projects = data.map((e) => ProjectGetDro.fromMap(e as Map<String, dynamic>)).toList();

    expect(projects, isNotEmpty);

    final languageUtility = LanguageUtility();
    for (final project in projects) {
      for (final language in Language.values) {
        final detail = languageUtility.findDetailByLanguage(language: language, details: project.details);
        expect(detail, isNotNull, reason: '${project.projectCode} 에 ${language.name} 상세가 없다');
        expect(detail!.title.trim(), isNotEmpty, reason: '${project.projectCode}/${language.name} 제목이 비었다');
        expect(detail.detail.trim(), isNotEmpty, reason: '${project.projectCode}/${language.name} 본문이 비었다');
      }

      for (final attachment in project.attachments) {
        final file = File('assets/images/projects/${attachment.originalFilename}');
        expect(file.existsSync(), isTrue, reason: '${project.projectCode} 의 첨부 ${attachment.originalFilename} 파일이 없다');
      }
    }
  });

  test('myquiz 항목이 기대한 값으로 들어있다', () {
    final data = jsonDecode(File('assets/jsons/projects.json').readAsStringSync()) as List<dynamic>;
    final projects = data.map((e) => ProjectGetDro.fromMap(e as Map<String, dynamic>)).toList();
    final myquiz = projects.firstWhere((e) => e.projectCode == 'myquiz');

    expect(myquiz.isHide, isFalse);
    expect(myquiz.refUrl, 'https://myquiz.co.kr');
    expect(myquiz.periodEnd, isNull, reason: '진행중이므로 종료일이 없어야 한다');
    expect(myquiz.attachments.single.originalFilename, 'myquiz_1.webp');
  });
}
