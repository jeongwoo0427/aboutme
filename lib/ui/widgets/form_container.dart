import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormContainer extends StatelessWidget {

  final EdgeInsets? padding;
  final Widget child;
  final GlobalKey<FormState>? formKey;

  const FormContainer({super.key, this.padding , required this.child,this.formKey});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: padding,
          child: Form(
            key: formKey,
            child: child,
          ),
      ),
    );
  }
}
