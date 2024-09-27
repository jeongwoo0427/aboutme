import 'package:aboutme/app_router.dart';
import 'package:aboutme/cores/extensions/widget_ref_extension.dart';
import 'package:aboutme/ui/widgets/boxes/max_width_box.dart';
import 'package:aboutme/ui/widgets/buttons/rounded_flat_button.dart';
import 'package:aboutme/ui/widgets/container/glassy_container.dart';
import 'package:aboutme/ui/widgets/scaffold/responsive_glassy_scaffold.dart';
import 'package:aboutme/ui/widgets/textfields/rounded_textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ContactScreen extends ConsumerStatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);

  static const routeName = 'ContactScreen';

  @override
  ConsumerState<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends ConsumerState<ContactScreen> with TickerProviderStateMixin {
  late final AnimationController _fadeInController;
  late final AnimationController _fadeOutController;

  @override
  void initState() {
    _fadeInController = AnimationController(vsync: this);
    _fadeOutController = AnimationController(vsync: this);
    Future.delayed(const Duration(milliseconds: 1000),()=>_playFadeIn());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveGlassyScaffold(
      appbarTitle: Text('Contact'),
      body: MaxSizedBox(
        maxWidth: 600,
        maxHeight: 400,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: _Form(
            onPressedSend: _onPressedSend,
          ).animate(controller: _fadeInController, autoPlay: false, effects: [
            const FadeEffect(curve: Curves.decelerate, begin: 0, end: 1, duration: Duration(milliseconds: 1000)),
            const MoveEffect(duration: Duration(milliseconds: 1000), curve: Curves.decelerate, begin: Offset(-200, 0), end: Offset(0, 0))
          ]).animate(controller: _fadeOutController, autoPlay: false, effects: [
            const FadeEffect(curve: Curves.ease, begin: 1, end: 0, duration: Duration(milliseconds: 1000)),
            const MoveEffect(duration: Duration(milliseconds: 1000), curve: Curves.decelerate, begin: Offset(0, 0), end: Offset(300, 0))
          ]),
        ),
      ),
    );
  }

  void _playFadeIn() {
    _fadeOutController.reset();
    _fadeInController.reset();
    _fadeInController.forward();
  }

  void _playFadeOut() {
    _fadeOutController.reset();
    _fadeOutController.forward();
  }

  void _onPressedSend(String message, String myContact) {
    print(message);
    print(myContact);
    _playFadeOut();
    Future.delayed(const Duration(milliseconds: 2000),()=>_playFadeIn());
  }
}

class _Form extends ConsumerWidget {
  final Function(String message, String myContact) onPressedSend;

  const _Form({super.key, required this.onPressedSend});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GlassyContainer(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: RoundedTextFieldWidget(
              label: ref.localizations.contact_message_input_label,
              expands: true,
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                  child: RoundedTextFieldWidget(
                label: ref.localizations.contact_mycontact_input_label,
              )),
              const SizedBox(width: 10),
              RoundedFlatButton(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  onPressed: () {
                    onPressedSend('a', 'b');
                  },
                  child: Text('Send')),
            ],
          )
        ],
      ),
    );
  }
}
