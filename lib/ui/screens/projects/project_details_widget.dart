import 'package:aboutme/cores/extensions/build_context_extension.dart';
import 'package:aboutme/cores/extensions/widget_ref_extension.dart';
import 'package:aboutme/cores/services/api/datas/project/data_objects/project_attachment_get.dro.dart';
import 'package:aboutme/cores/services/api/datas/project/data_objects/project_detail_get.dro.dart';
import 'package:aboutme/cores/services/api/datas/project/data_objects/project_get.dro.dart';
import 'package:aboutme/cores/utils/language_utility.dart';
import 'package:aboutme/cores/utils/shared_utility.dart';
import 'package:aboutme/ui/screens/projects/image_viewer_dialog.dart';
import 'package:aboutme/ui/widgets/boxes/max_width_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProjectDetailsWidget extends ConsumerWidget {
  final ProjectGetDro? project;

  ProjectDetailsWidget({super.key, required this.project});

  final SharedUtility _sharedUtility = SharedUtility();
  final LanguageUtility _languageUtility = LanguageUtility();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isPotrait = MediaQuery.of(context).size.width < 1000;
    final currentLanguage = ref.currentLanguage;
    final List<ProjectDetailGetDro> details = project?.details ?? [];
    final ProjectDetailGetDro? detail =
        _languageUtility.findDetailByLanguage(language: currentLanguage, details: details);
    final List<ProjectAttachmentGetDro> attachments = project?.attachments ?? [];
    final ImageProvider imageProvider = AssetImage(
      'assets/images/projects/${attachments.firstOrNull?.originalFilename ?? ''}',
    );
    //final Image imageWidget =  Image.network('${APIService.baseUrl}/v1/portfolio/project/${project!.no}/attachment/download/${attachments.first.uuid}?${_pageEnteredTime.toString()}',fit: BoxFit.cover,)

    final Widget imageBox = GestureDetector(
      onTap: () {
        _showImageZoomDialog(context, imageProvider);
      },
      child: MaxSizedBox(
        maxWidth: 600,
        child: Center(
          child: AspectRatio(
              aspectRatio: 5 / 3,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(21),
                    border: Border.all(color: context.colorScheme.onSurface, width: 1)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: (project == null || attachments.isEmpty)
                      ? const Text('No Image')
                      : Stack(
                          children: [
                            Positioned.fill(
                              child: Center(
                                child: CircularProgressIndicator(
                                  color: context.colorScheme.onSurface,
                                ),
                              ),
                            ),
                            Positioned.fill(
                              child: Image(image: imageProvider, fit: BoxFit.cover),
                            )
                          ],
                        ),
                ),
              )),
        ),
      ),
    );

    final Widget detailBox = MaxSizedBox(
      maxWidth: 500,
      maxHeight: 400,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            width: double.infinity,
          ),
          Expanded(
              flex: 3,
              child: Text(
                detail?.title ?? '',
                style: TextStyle(
                  fontSize: isPotrait ? 25 : 30,
                  fontWeight: FontWeight.w700,
                ),
              )),
          Expanded(
              flex: 11,
              child: ListView(
                children: [
                  Text(
                    detail?.detail ?? '',
                    style: TextStyle(fontSize: isPotrait ? 14 : 16, fontWeight: FontWeight.w300),
                  ),
                ],
              )),
          const Spacer(
            flex: 1,
          ),
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Text(
                  '${ref.localizations.projects_details_project_date}: ',
                  style: TextStyle(fontSize: isPotrait ? 15 : 17, fontWeight: FontWeight.w900),
                ),
                Text(
                  '${_sharedUtility.convertDateTimeToYearAndDateOnlyString(project?.periodStart)} - ${_sharedUtility.convertDateTimeToYearAndDateOnlyString(project?.periodEnd) ?? 'Now'}',
                  style: TextStyle(fontSize: isPotrait ? 15 : 17, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          Expanded(
              flex: 3,
              child: Row(
                children: [
                  Text(
                    '${ref.localizations.projects_details_use_skills}: ',
                    style: TextStyle(fontSize: isPotrait ? 15 : 17, fontWeight: FontWeight.w900),
                  ),
                  Text(
                    project?.skills ?? '',
                    style: TextStyle(fontSize: isPotrait ? 15 : 17, fontWeight: FontWeight.w500),
                  ),
                ],
              )),
          if (project?.refUrl != null)
            Expanded(
                flex: 3,
                child: Row(
                  children: [
                    Text(
                      'URL: ',
                      style: TextStyle(fontSize: isPotrait ? 15 : 17, fontWeight: FontWeight.w900),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          SharedUtility().openUrl(project?.refUrl ?? '');
                        },
                        child: Text(
                          project?.refUrl ?? '',
                          style: TextStyle(
                              fontSize: isPotrait ? 15 : 17,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ),
                  ],
                )),
        ],
      ),
    );

    if (isPotrait) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const Spacer(
            flex: 2,
          ),
          if (attachments.isNotEmpty)
            Expanded(flex: 5, child: Padding(padding: const EdgeInsets.all(15), child: imageBox)),
          Expanded(flex: 8, child: Padding(padding: const EdgeInsets.all(15), child: detailBox)),
          const Spacer(
            flex: 4,
          )
        ],
      );
    } else {
      return Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          if (attachments.isNotEmpty)
            const Spacer(
              flex: 4,
            ),
          if (attachments.isNotEmpty) Expanded(flex: 6, child: imageBox),
          const Spacer(flex: 1),
          Expanded(flex: 8, child: detailBox),
          const Spacer(
            flex: 1,
          ),
        ],
      );
    }
  }

  Future<void> _showImageZoomDialog(BuildContext context, ImageProvider imageProvider) async {
    await showDialog(
        context: context,
        builder: (context) {
          return ImageViewerDialog(
            imageProvider: imageProvider,
          );
        });
  }
}
