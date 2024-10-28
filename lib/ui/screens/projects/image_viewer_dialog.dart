import 'package:aboutme/cores/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ImageViewerDialog extends StatelessWidget {
  final double borderRadiusCircular;
  final ImageProvider imageProvider;

  const ImageViewerDialog({Key? key, this.borderRadiusCircular = 20, required this.imageProvider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadiusCircular), side: BorderSide(color: context.colorScheme.onSurface, width: 1)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadiusCircular),
        child: Container(
          width: context.screenSize.width * 0.9,
          height: context.screenSize.height * 0.9,
          color: context.colorScheme.surface,
          child: PhotoView(
            imageProvider: imageProvider,
          ),
        ),
      ),
    );
  }
}
