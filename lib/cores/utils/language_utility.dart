import 'package:aboutme/constants/app_constants.dart';
import 'package:aboutme/cores/services/api/datas/project/data_objects/project_detail_get.dro.dart';

class LanguageUtility {
  ProjectDetailGetDro? findDetailByLanguage({required Language language, required List<ProjectDetailGetDro> details}) {
    ProjectDetailGetDro? detail;
    for(int i = 0 ; i<details.length; i++){
      if(details[i].language.trim().toLowerCase() == languageCodes[language]){
        detail = details[i];
      }
    }

    return detail;
  }
}
