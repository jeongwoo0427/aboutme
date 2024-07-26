
import 'package:aboutme/cores/extensions/build_context_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../ui/widgets/dialogs/card_button_dialog.dart';
import '../../../ui/widgets/dialogs/progress_dialog/progress_dialog.dart';
import '../handlers/exception_handler.dart';
import '../handlers/exception_handler_result.dart';

mixin DialogMixin {

  ProgressDialog? _progressDialog;
  void showProgressDialog(BuildContext context){
    _progressDialog ??= ProgressDialog(context: context);
    _progressDialog!.show(
        backgroundColor: context.colorScheme.onSurface.withOpacity(0.3),
        progressBgColor: context.colorScheme.surface.withOpacity(0.3),
        progressValueColor: context.colorScheme.primary,
        msgColor: Theme.of(context).colorScheme.surface, hideValue: true,msgMaxLines: 2);
  }

  void closeProgressDialog(){
    if(_progressDialog==null) return;
    _progressDialog!.close();
  }


  Future<void> progressTasksWithDialog(BuildContext context,
      {int delayMs = 500,
        int closeMs = 5000,
      String? msg,
      hideValue = true,
      required Future<bool?> Function(ProgressDialog progressDialog) callBackTasks,
      Function? onComplete,
      Function(dynamic ex, dynamic stack)? onError}) async {
    ProgressDialog progressDialog = ProgressDialog(context: context,);
    try {
      progressDialog.show(
          msg:msg,
          backgroundColor: context.colorScheme.onSurface.withOpacity(0.3),
          progressBgColor: context.colorScheme.surface.withOpacity(0.3),
          progressValueColor: context.colorScheme.primary,
          msgColor: Theme.of(context).colorScheme.surface, hideValue: hideValue,msgMaxLines: 2);

      await Future.delayed(Duration(milliseconds: delayMs));
      Future.delayed(Duration(milliseconds: closeMs + delayMs+1),(){
        if(progressDialog.isOpen()) progressDialog.close();
      });


      final result = await callBackTasks(progressDialog);

      progressDialog.close();

      if(result == false) return; //true 또는 null 일 경우 onComplete함수 실행

      if (onComplete != null) {
        await onComplete();
      }
    } catch (ex, stack) {
      progressDialog.close();
      if (onError != null) {
        await onError(ex, stack);
      }
      if(!context.mounted) return;
      await showExceptionDialog(context, ex, stack);
    }
  }

  Future<void> showAlertDialog(BuildContext context,
      {required Widget title,
      required Widget content,
      String? positiveText,
      bool barrierDismissible = true}) async {
    await showDialog(
        context: context,
        barrierDismissible: barrierDismissible,
        builder: (context) {
          return AlertDialog(
            title: title,
            content: content,
            actions: [
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                    positiveText ?? 'Ok'),
              )
            ],
          );
        });
  }

  Future<void> showCardAlertDialog(BuildContext context,
      {required Widget content,
      String? positiveText,
      bool barrierDismissible = true}) async {
    await showDialog(
        context: context,
        barrierDismissible: barrierDismissible,
        builder: (context) {
          return CardButtonDialog(
            width: 150,
            child: Center(
              child: content,
            ),
            positiveText:
                positiveText ?? 'Ok',
            onTapPositive: () {
              Navigator.pop(context);
            },
          );
        });
  }

  Future<dynamic> showCardConfirmDialog(BuildContext context,
      {required Widget content,
      String? positiveText,
      String? negativeText,
      bool barrierDismissible = true}) async {
    final result = await showDialog(
        context: context,
        barrierDismissible: barrierDismissible,
        builder: (context) {
          return CardButtonDialog(
            //width: 150,
            child: Center(
              child: content,
            ),
            positiveText:
                positiveText ?? 'Yes',
            negativeText:
                negativeText ?? 'No',
            onTapPositive: () {
              Navigator.pop(context, true);
            },
            onTapNegative: () {
              Navigator.pop(context, false);
            },
          );
        });

    return result;
  }

  Future<dynamic> showExceptionDialog(BuildContext context, ex, stack) async {
    final ExceptionHandlerResult exceptionResult =
        ExceptionHandler.handlingException(context, ex, stack);
    await showAlertDialog(context,
        title: Text(exceptionResult.title),
        content: Text(exceptionResult.message));
  }

  Future<bool> showWillPopDialog(
    BuildContext context, {
    String? message,
  }) async {
    final result = await showCardConfirmDialog(context,
        content: Text(message ?? 'Close?'));
    if (result == true) {
      return true;
    } else {
      return false;
    }
  }
}
