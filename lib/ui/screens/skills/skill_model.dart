enum Skill { flutter, nodejs, mariadb, nestjs,dotnet,linux,nginx,androidstudio, vscode, socketio, github }

class SkillModel {
  final Skill skill;
  final String iconAsset;
  final String description;

  const SkillModel(
      {required this.skill,
      required this.iconAsset,
      required this.description});
}

const Map<Skill, SkillModel> mySkills ={
  Skill.flutter : SkillModel(skill: Skill.flutter, iconAsset: 'assets/vectors/flutter.svg',description: ''),
  Skill.nodejs : SkillModel(skill: Skill.nodejs, iconAsset: 'assets/vectors/nodejs.svg',description: ''),
  Skill.mariadb : SkillModel(skill: Skill.mariadb, iconAsset: 'assets/vectors/mariadb.svg',description: ''),
  Skill.nestjs : SkillModel(skill: Skill.nestjs, iconAsset: 'assets/vectors/nestjs.svg',description: ''),
  Skill.dotnet : SkillModel(skill: Skill.dotnet, iconAsset: 'assets/vectors/dotnet.svg',description: ''),
  Skill.linux : SkillModel(skill: Skill.linux, iconAsset: 'assets/vectors/linux.svg',description: ''),
  Skill.nginx : SkillModel(skill: Skill.nginx, iconAsset: 'assets/vectors/nginx.svg',description: ''),
  Skill.androidstudio : SkillModel(skill: Skill.androidstudio, iconAsset: 'assets/vectors/androidstudio.svg',description: ''),
  Skill.vscode : SkillModel(skill: Skill.vscode, iconAsset: 'assets/vectors/vscode.svg',description: ''),
  Skill.socketio : SkillModel(skill: Skill.socketio, iconAsset: 'assets/vectors/socketio.svg',description: ''),
  Skill.github : SkillModel(skill: Skill.github, iconAsset: 'assets/vectors/github.svg',description: ''),
};
