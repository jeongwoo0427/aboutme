import 'package:flutter/material.dart';

class CardContainerDialog extends StatelessWidget {
  final Widget? topChild;
  final Widget? child;
  final double width;
  final double? height;
  final double maxHeight;
  final double borderRadiusCirular;
  final String confirmText;
  final VoidCallback? onTapConfirm;
  final Future<bool> Function()? onPop;

  const CardContainerDialog({Key? key,this.topChild, this.child, this.width = 600,this.height,this.maxHeight=double.infinity, this.borderRadiusCirular = 20, this.confirmText = '', this.onTapConfirm,this.onPop}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return PopScope(
      canPop: onPop==null,
      onPopInvoked: (pop)async {
        print(pop);
        if(onPop != null&&pop==false){
          final popResult = await onPop!();
          if(popResult==true) Navigator.pop(context,false);
        }

      },
      child: Dialog(
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadiusCirular), side: BorderSide(color: colorScheme.primaryContainer, width: 3)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(borderRadiusCirular),
          child: Container(
              width: width,
              height: height,
              constraints: BoxConstraints(minHeight: 160,maxHeight: maxHeight),
              decoration: BoxDecoration(
                color: colorScheme.background,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Material(
                    color: colorScheme.primaryContainer,
                    child: Container(
                      child: Row(children: [
                        SizedBox(width: 15,),
                        if(topChild!=null)
                        topChild!,
                        Expanded(child: SizedBox()),


                        IconButton(
                            onPressed: () async {
                              if(onPop!=null){
                                final popResult = await onPop!();
                                if(popResult != true) return;
                              }
                              Navigator.pop(context,false);
                            },
                            icon: Icon(Icons.close_rounded)),
                        SizedBox(width: 10,)
                      ],),
                      width: double.infinity,
                      height: 50,
                    ),
                  ),
                  Expanded(
                    child: DefaultTextStyle(style: TextStyle(fontWeight: FontWeight.w700, color: colorScheme.onBackground), child: child ?? SizedBox()),
                  ),

                ],
              )),
        ),
      ),
    );
  }
}
