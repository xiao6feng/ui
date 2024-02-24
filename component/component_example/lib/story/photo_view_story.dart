import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:component/component.dart';
import 'package:theme/theme.dart';

final Story photoViewStory = Story(
  name: 'Widgets/photo_view',
  wrapperBuilder: (context, child) {
    return MaterialApp(
      theme: ThemeData(
        extensions: AppTheme.themes,
      ),
      home: child,
    );
  },
  builder: (context) => Scaffold(
    body: Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 10,
          color: Colors.red,
        ),
        GalleryView(
          galleryItemSize: const Size(90, 90),
          photoViewConfig: PhotoViewConfig(galleryItems: galleryItems),
        ),
        Container(
          height: 10,
          color: Colors.red,
        )
      ],
    )),
  ),
);

final List<GalleryItem> galleryItems = <GalleryItem>[
  // NetworkImage('url')
  //AssetImage("assets/images/gallery1.jpg")
  // FileImage(file)
  GalleryItem(
    id: "tag1",
    resource: AssetImage("assets/images/gallery1.jpg"),
  ),
  GalleryItem(
    id: "tag3",
    resource: AssetImage("assets/images/gallery2.jpg"),
  ),
  GalleryItem(
    id: "tag4",
    resource: AssetImage("assets/images/gallery1.jpg"),
  ),
  GalleryItem(
    id: "tag5",
    resource: AssetImage("assets/images/gallery2.jpg"),
  ),
  GalleryItem(
    id: "tag6",
    resource: AssetImage("assets/images/gallery1.jpg"),
  ),
  GalleryItem(
    id: "tag7",
    resource: AssetImage("assets/images/gallery2.jpg"),
  ),
];
