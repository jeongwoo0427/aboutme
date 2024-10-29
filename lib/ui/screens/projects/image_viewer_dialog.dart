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
          child: Stack(
            children: [
              Positioned.fill(
                child: PhotoView(
                  imageProvider: imageProvider,

                ),
              ),
              Positioned(
                top: context.getResponsiveValue(20, 10),
                right: context.getResponsiveValue(20, 10),
                child: IconButton(
                  icon: Icon(Icons.close,
                      size: context.getResponsiveValue(
                        30,
                        20,
                      )),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
