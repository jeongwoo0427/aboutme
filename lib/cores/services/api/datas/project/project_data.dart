
import 'package:aboutme/cores/services/api/api_service.dart';
import 'package:aboutme/cores/services/api/datas/project/data_objects/project_get.dro.dart';

class ProjectData{
  Future<List<ProjectGetDro>> getProjectsV1() async{
    final String pathString = '/v1/portfolio/project';
    final data = await APIService().request(pathString,method: 'GET');
    final List<ProjectGetDro> projects = [];
    for(int i = 0; i<data.length; i++){
      projects.add(ProjectGetDro.fromMap(data[i]));
    }
    return projects;
  }
}