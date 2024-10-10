import 'package:aboutme/ui/screens/skills/skill_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedSkillProvider = StateNotifierProvider<SelectedSkillNotifier, Skill?>((ref) {
  return SelectedSkillNotifier();
});

class SelectedSkillNotifier extends StateNotifier<Skill?> {
  SelectedSkillNotifier() : super(null);

  Skill? get currentSkill => state;

  void changeSkill(Skill? skill) {
    state = skill;
  }
}
