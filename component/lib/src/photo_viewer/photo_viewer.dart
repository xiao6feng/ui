import 'package:component/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:theme/theme.dart';

import 'gallery/gallery_item.dart';
import 'photo_view_config.dart';

class PhotoViewer extends StatefulWidget {
  PhotoViewer({
    required this.config,
    this.initialIndex = 0,
  }) : pageController = PageController(initialPage: initialIndex);

  final int initialIndex;
  final PageController pageController;
  final PhotoViewConfig config;

  @override
  State<StatefulWidget> createState() {
    return _PhotoViewerState();
  }
}

class _PhotoViewerState extends State<PhotoViewer> {
  late int currentIndex = widget.initialIndex;

  void onPageChanged(int index) {
    if (widget.config.onPageChanged != null) {
      widget.config.onPageChanged!(context, index);
    }
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final PhotoViewTheme? theme =
        Theme.of(context).extension<AppTheme>()?.photoViewTheme;

    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(
          height: MediaQuery.sizeOf(context).height,
        ),
        child: Stack(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: PhotoViewGallery.builder(
                scrollPhysics: const BouncingScrollPhysics(),
                builder: _buildItem,
                itemCount: widget.config.galleryItems.length,
                loadingBuilder: widget.config.loadingBuilder,
                backgroundDecoration: theme?.backgroundDecoration,
                pageController: widget.pageController,
                onPageChanged: onPageChanged,
                scrollDirection: widget.config.scrollDirection,
              ),
            ),
            Positioned(top: 0, left: 0, right: 0, child: _buildAppBar()),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    if (widget.config.barBuilder != null) {
      return widget.config.barBuilder!(context, currentIndex);
    }

    final PhotoViewTheme? theme =
        Theme.of(context).extension<AppTheme>()?.photoViewTheme;

    return SafeArea(
      child: Padding(
        padding:
            theme?.barItemPadding ?? const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: theme?.barBack ??
                  Image.asset(
                    Assets.images.icon.back.path,
                    package: 'component',
                    width: 30,
                    height: 30,
                  ),
            ),
            Text(
              " ${currentIndex + 1}/${widget.config.galleryItems.length}",
              style: theme?.indexIndicatorStyle ??
                  const TextStyle(
                    color: Colors.white,
                    fontSize: 17.0,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  PhotoViewGalleryPageOptions _buildItem(BuildContext context, int index) {
    if (widget.config.cellBuilder != null) {
      return widget.config.cellBuilder!(context, index);
    }
    final GalleryItem item = widget.config.galleryItems[index];
    return PhotoViewGalleryPageOptions(
      imageProvider: item.resource,
      initialScale: PhotoViewComputedScale.contained,
      minScale: PhotoViewComputedScale.contained * widget.config.minScale,
      maxScale: PhotoViewComputedScale.covered * widget.config.maxScale,
      heroAttributes: PhotoViewHeroAttributes(tag: item.id),
    );
  }
}
