import 'dart:typed_data';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart' hide Image;

typedef ImageLoadingBuilder = Widget Function();
typedef ImageErrorBuilder = Widget Function();

class Image extends StatelessWidget {
  final ExtendedImage extendImage;

  Image.auto(
    String src, {
    Key? key,
    BoxFit? fit,
    double? height,
    double? width,
    String? package,
    Color? color,
    BlendMode? colorBlendMode,
    bool gaplessPlayback = false,
    Alignment alignment = Alignment.center,
    BoxBorder? border,
    BorderRadius? borderRadius,
    BoxShape? shape,
  }) : extendImage = ExtendedImage(
          image: _autoSelectProvide(src, package),
          key: key,
          height: height,
          width: width,
          alignment: alignment,
          color: color,
          colorBlendMode: colorBlendMode,
          gaplessPlayback: gaplessPlayback,
          loadStateChanged: (ExtendedImageState state) {
            return switch (state.extendedImageLoadState) {
              LoadState.loading => _Placeholder(),
              LoadState.completed => null,
              LoadState.failed => _Placeholder(),
            };
          },
          fit: fit,
          border: border,
        );

  Image.network(
    String url, {
    Key? key,
    BoxFit? fit,
    double? height,
    double? width,
    Alignment alignment = Alignment.center,
    String? cacheKey,
    Color? color,
    BlendMode? colorBlendMode,
    bool gaplessPlayback = false,
    BoxBorder? border,
    BorderRadius? borderRadius,
    BoxShape? shape,
    ImageLoadingBuilder? loadingBuilder,
    ImageErrorBuilder? errorBuilder,
  }) : extendImage = ExtendedImage.network(
          url,
          key: key,
          height: height,
          width: width,
          alignment: alignment,
          cacheKey: cacheKey,
          color: color,
          colorBlendMode: colorBlendMode,
          gaplessPlayback: gaplessPlayback,
          loadStateChanged: (ExtendedImageState state) {
            return switch (state.extendedImageLoadState) {
              LoadState.loading => loadingBuilder?.call() ?? _Placeholder(),
              LoadState.completed => null,
              LoadState.failed => errorBuilder?.call() ?? _Placeholder(),
            };
          },
          fit: fit,
          border: border,
          borderRadius: borderRadius,
          shape: shape,
          headers: const {'accept': '*/*'},
        );

  Image.asset(
    String name, {
    Key? key,
    BoxFit? fit,
    double? height,
    double? width,
    String? package,
    Color? color,
    BlendMode? colorBlendMode,
    bool gaplessPlayback = false,
    Alignment alignment = Alignment.center,
    BoxBorder? border,
    BorderRadius? borderRadius,
    BoxShape? shape,
  }) : extendImage = ExtendedImage.asset(
          name,
          key: key,
          fit: fit,
          height: height,
          width: width,
          package: package,
          color: color,
          colorBlendMode: colorBlendMode,
          gaplessPlayback: gaplessPlayback,
          alignment: alignment,
          loadStateChanged: (ExtendedImageState state) {
            return switch (state.extendedImageLoadState) {
              LoadState.loading => _Placeholder(),
              LoadState.completed => null,
              LoadState.failed => _Placeholder(),
            };
          },
          border: border,
          borderRadius: borderRadius,
          shape: shape,
        );

  Image.memory(
    Uint8List bytes, {
    Key? key,
    BoxFit? fit,
    double? height,
    double? width,
    Color? color,
    BlendMode? colorBlendMode,
    bool gaplessPlayback = false,
    Alignment alignment = Alignment.center,
    BoxBorder? border,
    BorderRadius? borderRadius,
    BoxShape? shape,
    ImageLoadingBuilder? loadingBuilder,
    ImageErrorBuilder? errorBuilder,
  }) : extendImage = ExtendedImage.memory(
          bytes,
          key: key,
          fit: fit,
          height: height,
          width: width,
          color: color,
          colorBlendMode: colorBlendMode,
          gaplessPlayback: gaplessPlayback,
          alignment: alignment,
          loadStateChanged: (ExtendedImageState state) {
            return switch (state.extendedImageLoadState) {
              LoadState.loading => loadingBuilder?.call() ?? _Placeholder(),
              LoadState.completed => null,
              LoadState.failed => errorBuilder?.call() ?? _Placeholder(),
            };
          },
          border: border,
          borderRadius: borderRadius,
          shape: shape,
        );

  @override
  Widget build(BuildContext context) {
    return extendImage;
  }
}

ExtendedImageProvider _autoSelectProvide(String src, String? package) {
  try {
    final uri = Uri.parse(src);
    switch (uri.scheme) {
      case 'http' || 'https':
        return ExtendedNetworkImageProvider(
          src,
          headers: const {'accept': '*/*'},
        );
      default:
        return ExtendedAssetImageProvider(src, package: package);
    }
  } on FormatException {
    return ExtendedAssetImageProvider(src);
  }
}

class _Placeholder extends StatelessWidget {
  const _Placeholder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.04),
      ),
    );
  }
}
