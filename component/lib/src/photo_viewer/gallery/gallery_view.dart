import 'package:component/component.dart';
import 'package:flutter/material.dart';

class GalleryView extends StatelessWidget {
  GalleryView({
    Key? key,
    this.galleryItemSize = const Size(80, 80),
    this.alignment = WrapAlignment.start,
    this.spacing = 8.0,
    this.runAlignment = WrapAlignment.start,
    this.runSpacing = 8.0,
    required this.photoViewConfig,
  }) : super(key: key);

  final Size galleryItemSize;
  final double spacing;
  final double runSpacing;
  final WrapAlignment alignment;
  final WrapAlignment runAlignment;

  final PhotoViewConfig photoViewConfig;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: spacing,
      runSpacing: runSpacing,
      alignment: alignment,
      runAlignment: runAlignment,
      children: photoViewConfig.galleryItems
          .map((e) => GalleryItemThumbnail(
                galleryItem: e,
                galleryItemSize: galleryItemSize,
                onTap: () {
                  final index = photoViewConfig.galleryItems.indexOf(e);
                  open(context, index);
                },
              ))
          .toList(),
    );
  }

  void open(BuildContext context, final int index) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return PhotoViewer(
            config: photoViewConfig,
            initialIndex: index,
          );
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    );
  }
}
