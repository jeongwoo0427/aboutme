import 'package:aboutme/cores/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ImageViewerDialog extends StatelessWidget {
  final double borderRadiusCircular;
  final ImageProvider imageProvider;

  const ImageViewerDialog({super.key, this.borderRadiusCircular = 20, required this.imageProvider});

  @override
  Widget build(BuildContext context) {

    final bool isTablet = context.getResponsiveValue(false, true);

    return Dialog(
      insetPadding: isTablet?EdgeInsets.zero:null,
      backgroundColor: Colors.transparent,
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(isTablet?0:borderRadiusCircular), side: BorderSide(color: isTablet?Colors.transparent:context.colorScheme.onSurface, width: 1)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(isTablet?0:borderRadiusCircular),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: context.colorScheme.surface,
          child: Stack(
            children: [
              Positioned.fill(
                child: PhotoView(
                  imageProvider: imageProvider,
                  filterQuality: FilterQuality.high,
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
