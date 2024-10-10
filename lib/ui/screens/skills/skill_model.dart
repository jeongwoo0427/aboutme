enum Skill { flutter, nodejs, mariadb, nestjs, dotnet, linux, nginx, androidstudio, vscode, socketio, github }

class SkillModel {
  final Skill skill;
  final String name;
  final String iconAsset;
  final String description;

  const SkillModel({required this.skill, required this.name, required this.iconAsset, required this.description});
}

const Map<Skill, SkillModel> mySkills = {
  Skill.flutter: SkillModel(skill: Skill.flutter,name: 'Flutter', iconAsset: 'assets/vectors/flutter.svg', description: ''),
  Skill.nodejs: SkillModel(skill: Skill.nodejs,name: 'Node.js', iconAsset: 'assets/vectors/nodejs.svg', description: ''),
  Skill.mariadb: SkillModel(skill: Skill.mariadb,name: 'MariaDB', iconAsset: 'assets/vectors/mariadb.svg', description: ''),
  Skill.nestjs: SkillModel(skill: Skill.nestjs,name: 'Nest.js', iconAsset: 'assets/vectors/nestjs.svg', description: ''),
  Skill.dotnet: SkillModel(skill: Skill.dotnet,name: '.Net', iconAsset: 'assets/vectors/dotnet.svg', description: ''),
  Skill.linux: SkillModel(skill: Skill.linux,name: 'Linux', iconAsset: 'assets/vectors/linux.svg', description: ''),
  Skill.nginx: SkillModel(skill: Skill.nginx,name: 'Nginx', iconAsset: 'assets/vectors/nginx.svg', description: ''),
  Skill.androidstudio: SkillModel(skill: Skill.androidstudio,name: 'Android Studio', iconAsset: 'assets/vectors/androidstudio.svg', description: ''),
  Skill.vscode: SkillModel(skill: Skill.vscode,name: 'Visual Studio Code', iconAsset: 'assets/vectors/vscode.svg', description: ''),
  Skill.socketio: SkillModel(skill: Skill.socketio,name: 'Socket.io', iconAsset: 'assets/vectors/socketio.svg', description: ''),
  Skill.github: SkillModel(skill: Skill.github,name: 'Github', iconAsset: 'assets/vectors/github.svg', description: ''),
};
