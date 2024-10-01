enum Skill { flutter, nodejs, mariadb, nestjs }

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
};
