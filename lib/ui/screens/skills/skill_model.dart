enum Skill { flutter, nodejs, mariadb, nestjs, dotnet, linux, nginx, androidstudio, vscode, socketio, github }

class SkillModel {
  final Skill skill;
  final String code;
  final String name;
  final String iconAsset;
  final String startedAt;

  const SkillModel({required this.skill, required this.name, required this.iconAsset, required this.code, required this.startedAt});
}

const Map<Skill, SkillModel> mySkills = {
  Skill.flutter: SkillModel(skill: Skill.flutter, code: 'flutter',name: 'Flutter', iconAsset: 'assets/vectors/flutter.svg',startedAt: '2020-11-10'),
  Skill.nodejs: SkillModel(skill: Skill.nodejs, code: 'nodejs',name: 'Node.js', iconAsset: 'assets/vectors/nodejs.svg', startedAt: '2022-08-23'),
  Skill.mariadb: SkillModel(skill: Skill.mariadb, code: 'mariadb',name: 'MariaDB', iconAsset: 'assets/vectors/mariadb.svg', startedAt: '2020-02-04'),
  Skill.nestjs: SkillModel(skill: Skill.nestjs, code: 'nestjs',name: 'Nest.js', iconAsset: 'assets/vectors/nestjs.svg', startedAt: '2023-09-12'),
  Skill.dotnet: SkillModel(skill: Skill.dotnet, code: 'dotnet',name: '.Net', iconAsset: 'assets/vectors/dotnet.svg',startedAt: '2017-03-01'),
  Skill.linux: SkillModel(skill: Skill.linux, code: 'linux',name: 'Linux', iconAsset: 'assets/vectors/linux.svg', startedAt: '2021-06-02'),
  Skill.nginx: SkillModel(skill: Skill.nginx, code: 'nginx',name: 'Nginx', iconAsset: 'assets/vectors/nginx.svg', startedAt: '2022-08-18'),
  Skill.androidstudio: SkillModel(skill: Skill.androidstudio, code: 'androidstudio',name: 'Android Studio', iconAsset: 'assets/vectors/androidstudio.svg', startedAt: '2019-03-01'),
  Skill.vscode: SkillModel(skill: Skill.vscode, code: 'vscode',name: 'Visual Studio Code', iconAsset: 'assets/vectors/vscode.svg',startedAt: '2022-05-11'),
  Skill.socketio: SkillModel(skill: Skill.socketio, code: 'socketio',name: 'Socket.io', iconAsset: 'assets/vectors/socketio.svg', startedAt: '2023-10-11'),
  Skill.github: SkillModel(skill: Skill.github, code: 'github',name: 'Github', iconAsset: 'assets/vectors/github.svg', startedAt: '2021-01-23'),
};
