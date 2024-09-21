import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../styles/app_images.dart';

class ImageApp extends StatelessWidget {
  final String path;
  final double? width, height;
  final String? package;
  final BoxFit? fit;
  final Color? color;
  final double scale;
  final bool canGoHome;
  final bool isSvg;
  final Function? onClick;

  const ImageApp(this.path,
      {super.key,
      this.width,
      this.height,
      this.fit,
      this.color,
      this.scale = 1.0,
      this.package,
      this.canGoHome = true,
      this.isSvg = false,
      this.onClick});

  ImageProvider provider() {
    if (path.startsWith('http') || path.startsWith('https')) {
      return CachedNetworkImageProvider(path);
    } else {
      return AssetImage(path, package: package);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (path.startsWith('http') || path.startsWith('https')) {
      if (scale == 1.0) {
        return CachedNetworkImage(
          imageUrl: path,
          width: width,
          height: height,
          fit: fit,
          color: color,
        );
      }
      return Image.network(
        path,
        width: width,
        height: height,
        fit: fit,
        color: color,
        scale: scale,
      );
    } else {
      return GestureDetector(
        onTap: () {
          if ((path == AppImages.logoApp) && canGoHome) {
            Modular.to.pushNamedAndRemoveUntil("/home/", (route) => false,
                forRoot: true);
          } else {
            onClick?.call();
          }
        },
        child: !isSvg
            ? Image.asset(
                path,
                width: width,
                height: height,
                fit: fit,
                color: color,
                scale: scale,
                package: package,
              )
            : SvgPicture.asset(
                path,
                width: width,
                height: height,
                fit: fit ?? BoxFit.contain,
                colorFilter: ColorFilter.mode(
                  color ?? Colors.black,
                  BlendMode.srcIn,
                ),
                package: package,
              ),
      );
    }
  }
}
