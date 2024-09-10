import 'package:flutter/material.dart';
import 'package:gallary_website_app/src/domain/entities/gallary.dart';
import 'package:gallary_website_app/src/presentation/widgets/dialog_image_widget.dart';

void showImageDialog({
  required BuildContext context,
  required List<ImageModel> images,
  required int currentIndex,
})async {
  return await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => Dialog(
      elevation: 0,
      backgroundColor: Colors.white,
      insetPadding: const EdgeInsets.symmetric(horizontal: 16),
      child: DialogImageWidget(
        images: images,
        currentIndex: currentIndex,
      ),
    ),
  );
}
