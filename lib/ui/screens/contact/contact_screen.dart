import 'package:aboutme/cores/extensions/widget_ref_extension.dart';
import 'package:aboutme/ui/widgets/boxes/max_width_box.dart';
import 'package:aboutme/ui/widgets/buttons/rounded_flat_button.dart';
import 'package:aboutme/ui/widgets/container/glassy_container.dart';
import 'package:aboutme/ui/widgets/scaffold/responsive_glassy_scaffold.dart';
import 'package:aboutme/ui/widgets/textfields/rounded_textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ContactScreen extends ConsumerStatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);

  static const routeName = 'ContactScreen';

  @override
  ConsumerState<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends ConsumerState<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveGlassyScaffold(
      appbarTitle: Text('Contact'),
      body: MaxSizedBox(
        maxWidth: 600,
        maxHeight: 400,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: GlassyContainer(
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
                    Expanded(child: RoundedTextFieldWidget(label: ref.localizations.contact_mycontact_input_label,)),
                    const SizedBox(width: 10),
                    RoundedFlatButton(
                        padding: EdgeInsets.symmetric(horizontal: 15,vertical: 20),
                        onPressed: (){}, child: Text('Send')),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
