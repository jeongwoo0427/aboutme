import 'package:flutter/material.dart';

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
      {super.key,
      this.child,
      this.width = 200,
      this.maxHeight = double.infinity,
      this.borderRadiusCirular = 30,
      required this.positiveText,
      this.negativeText,
      this.onTapPositive,
      this.onTapNegative});

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
              color: colorScheme.surface,
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
                const SizedBox(),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    child: DefaultTextStyle(
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: colorScheme.onSurface),
                        child: child ?? const SizedBox())),
                Row(
                  children: [

                    if (negativeText != null)
                      Expanded(
                        child: Material(
                          color: colorScheme.primaryContainer,
                          child: InkWell(
                            onTap: onTapNegative,
                            child: SizedBox(
                              height: 50,
                              child: Center(
                                  child: Text(
                                    negativeText!,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        color: colorScheme.onError),
                                  )),
                            ),
                          ),
                        ),
                      ),
                    if (negativeText != null) const VerticalDivider(width: 2),
                    Expanded(
                      child: Material(
                        color: colorScheme.primaryContainer,
                        child: InkWell(
                          onTap: onTapPositive,
                          child: SizedBox(
                            height: 50,
                            child: Center(
                                child: Text(
                              positiveText,
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  color: colorScheme.onPrimary),
                            )),
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
