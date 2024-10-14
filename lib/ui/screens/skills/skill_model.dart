enum Skill { flutter, nodejs, mariadb, nestjs, dotnet, linux, nginx, androidstudio, vscode, socketio, github }

class SkillModel {
  final Skill skill;
  final String name;
  final String iconAsset;
  final String code;

  const SkillModel({required this.skill, required this.name, required this.iconAsset, required this.code});
}

const Map<Skill, SkillModel> mySkills = {
  Skill.flutter: SkillModel(skill: Skill.flutter, code: 'flutter',name: 'Flutter', iconAsset: 'assets/vectors/flutter.svg'),
  Skill.nodejs: SkillModel(skill: Skill.nodejs, code: 'nodejs',name: 'Node.js', iconAsset: 'assets/vectors/nodejs.svg'),
  Skill.mariadb: SkillModel(skill: Skill.mariadb, code: 'mariadb',name: 'MariaDB', iconAsset: 'assets/vectors/mariadb.svg'),
  Skill.nestjs: SkillModel(skill: Skill.nestjs, code: 'nestjs',name: 'Nest.js', iconAsset: 'assets/vectors/nestjs.svg'),
  Skill.dotnet: SkillModel(skill: Skill.dotnet, code: 'dotnet',name: '.Net', iconAsset: 'assets/vectors/dotnet.svg'),
  Skill.linux: SkillModel(skill: Skill.linux, code: 'linux',name: 'Linux', iconAsset: 'assets/vectors/linux.svg'),
  Skill.nginx: SkillModel(skill: Skill.nginx, code: 'nginx',name: 'Nginx', iconAsset: 'assets/vectors/nginx.svg'),
  Skill.androidstudio: SkillModel(skill: Skill.androidstudio, code: 'androidstudio',name: 'Android Studio', iconAsset: 'assets/vectors/androidstudio.svg'),
  Skill.vscode: SkillModel(skill: Skill.vscode, code: 'vscode',name: 'Visual Studio Code', iconAsset: 'assets/vectors/vscode.svg'),
  Skill.socketio: SkillModel(skill: Skill.socketio, code: 'socketio',name: 'Socket.io', iconAsset: 'assets/vectors/socketio.svg'),
  Skill.github: SkillModel(skill: Skill.github, code: 'github',name: 'Github', iconAsset: 'assets/vectors/github.svg'),
};
