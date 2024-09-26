import 'package:aboutme/ui/widgets/boxes/max_width_box.dart';
import 'package:aboutme/ui/widgets/buttons/rounded_flat_button.dart';
import 'package:aboutme/ui/widgets/container/glassy_container.dart';
import 'package:aboutme/ui/widgets/scaffold/responsive_glassy_scaffold.dart';
import 'package:aboutme/ui/widgets/textfields/rounded_textfield_widget.dart';
import 'package:flutter/material.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);

  static const routeName = 'ContactScreen';

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveGlassyScaffold(
      appbarTitle: Text('Contact'),
      body: MaxSizedBox(
        maxWidth: 500,
        maxHeight: 300,
        child: GlassyContainer(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: RoundedTextFieldWidget(
                  expands: true,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  RoundedFlatButton(onPressed: (){}, child: Text('Submit'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
