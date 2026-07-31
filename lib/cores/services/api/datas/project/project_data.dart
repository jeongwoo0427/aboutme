
import 'dart:convert';

import 'package:aboutme/constants/app_assets.dart';
import 'package:aboutme/cores/services/api/api_service.dart';
import 'package:aboutme/cores/services/api/datas/project/data_objects/project_get.dro.dart';
import 'package:flutter/services.dart';

class ProjectData{
  ///에셋 JSON은 앱 실행 중 바뀌지 않으므로 화면에 들어올 때마다 다시 파싱하지 않는다.
  static List<ProjectGetDro>? _cachedAssetProjects;

  Future<List<ProjectGetDro>> getProjectsV1() async{
    const String pathString = '/v1/portfolio/project';
    final data = await APIService().request(pathString,method: 'GET');
    final List<ProjectGetDro> projects = [];
    for(int i = 0; i<data.length; i++){
      projects.add(ProjectGetDro.fromMap(data[i]));
    }
    return projects;
  }

  Future<List<ProjectGetDro>> getProjectsFromAsset() async{
    final cached = _cachedAssetProjects;
    if(cached != null){
      return cached;
    }

    final jsonString = await rootBundle.loadString(AppAssets.JSON_PROJECTS);
    final data = jsonDecode(jsonString);
    final List<ProjectGetDro> projects = [];
    for(int i = 0; i<data.length; i++){
      projects.add(ProjectGetDro.fromMap(data[i]));
    }
    _cachedAssetProjects = projects;
    return projects;
  }
}