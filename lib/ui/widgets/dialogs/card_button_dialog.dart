import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CardButtonDialog extends StatelessWidget {
  final Widget? child;
  final double? width;
  final double maxHeight;
  final double borderRadiusCirular;
  final String positiveText;
  final String? negativeText;
  final VoidCallback? onTapPositive;
  final VoidCallback? onTapNegative;

  const CardButtonDialog(
      {Key? key,
      this.child,
      this.width = 200,
      this.maxHeight = double.infinity,
      this.borderRadiusCirular = 30,
      required this.positiveText,
      this.negativeText,
      this.onTapPositive,
      this.onTapNegative})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Dialog(
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadiusCirular),
          side: BorderSide(color: colorScheme.primaryContainer, width: 3)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadiusCirular),
        child: Container(
            width: width,
            constraints: BoxConstraints(minHeight: 160, maxHeight: maxHeight),
            decoration: BoxDecoration(
              color: colorScheme.background,
              // border: Border.all(
              //   color: colorScheme.primary,
              //   width: 3,
              // ),
              //borderRadius: BorderRadius.circular(borderRadiusCirular),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(),
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    child: DefaultTextStyle(
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: colorScheme.onBackground),
                        child: child ?? SizedBox())),
                Row(
                  children: [

                    if (negativeText != null)
                      Expanded(
                        child: Material(
                          color: colorScheme.primaryContainer,
                          child: InkWell(
                            onTap: onTapNegative,
                            child: Container(
                              child: Center(
                                  child: Text(
                                    negativeText!,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        color: colorScheme.onError),
                                  )),
                              height: 50,
                            ),
                          ),
                        ),
                      ),
                    if (negativeText != null) const VerticalDivider(width: 2),
                    if (positiveText != null)
                      Expanded(
                        child: Material(
                          color: colorScheme.primaryContainer,
                          child: InkWell(
                            onTap: onTapPositive,
                            child: Container(
                              child: Center(
                                  child: Text(
                                positiveText!,
                                style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    color: colorScheme.onPrimary),
                              )),
                              height: 50,
                            ),
                          ),
                        ),
                      ),

                  ],
                )
              ],
            )),
      ),
    );
  }
}
