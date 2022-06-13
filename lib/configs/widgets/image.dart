import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shiheyishu/configs/common.dart';

enum ImageType {
  normal,
  assets, //资源目录
}

class WrapperImage extends StatelessWidget {
  final String? url;
  final double? width;
  final double? height;
  final BoxFit fit;
  final ImageType imageType;

  WrapperImage(
      {@required this.url,
      @required this.width,
      @required this.height,
      this.imageType: ImageType.normal,
      this.fit: BoxFit.cover});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      placeholder: (_, __) =>
          ImageHelper.placeHolder(width: width, height: height),
      errorWidget: (_, __, ___) =>
          ImageHelper.error(width: width, height: height),
      fit: fit,
    );
  }

  String get imageUrl {
    switch (imageType) {
      case ImageType.assets:
        return ImageHelper.wrapAssets(url!);
      case ImageType.normal:
        return url!;
    }
  }
}
