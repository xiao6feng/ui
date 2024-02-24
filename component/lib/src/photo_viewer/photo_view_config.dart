import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

import 'gallery/gallery_item.dart';

typedef BarBuilder = Widget Function(BuildContext context, int index);
typedef CellBuilder = PhotoViewGalleryPageOptions Function(
    BuildContext context, int index);
typedef OnPageChanged = Function(BuildContext context, int index);

class PhotoViewConfig {
  const PhotoViewConfig(
      {this.loadingBuilder,
      this.minScale = 0.5,
      this.maxScale = 4.0,
      required this.galleryItems,
      this.scrollDirection = Axis.horizontal,
      this.barBuilder,
      this.cellBuilder,
      this.onPageChanged});

  final LoadingBuilder? loadingBuilder;
  final double minScale;
  final double maxScale;
  final List<GalleryItem> galleryItems;
  final Axis scrollDirection;
  final BarBuilder? barBuilder;
  final CellBuilder? cellBuilder;
  final OnPageChanged? onPageChanged;
}
