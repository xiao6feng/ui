import 'package:flutter/material.dart';

class GalleryItem {
  GalleryItem({
    required this.id,
    required this.resource,
  });
  //hero tag
  final String id;
  final ImageProvider<Object> resource;
}

class GalleryItemThumbnail extends StatelessWidget {
  const GalleryItemThumbnail({
    Key? key,
    required this.galleryItem,
    required this.onTap,
    required this.galleryItemSize,
  }) : super(key: key);

  final GalleryItem galleryItem;

  final GestureTapCallback onTap;
  final Size galleryItemSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Hero(
        tag: galleryItem.id,
        child: Image(
          image: galleryItem.resource,
          fit: BoxFit.cover,
          width: galleryItemSize.width,
          height: galleryItemSize.height,
        ),
      ),
    );
  }
}
