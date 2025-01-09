import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../themes/my_colors.dart';

class MyNetworkImage extends StatelessWidget {
  const MyNetworkImage({
    super.key,
    required this.imageURL,
    this.boxFit,
    this.color,
    this.customErrorWidget,
    required this.aspectRatio,
    this.showPlaceholder = true,
  });

  final String? imageURL;
  final BoxFit? boxFit;
  final Widget? customErrorWidget;
  final Color? color;
  final double aspectRatio;
  final bool showPlaceholder;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: (imageURL != null && imageURL!.isNotEmpty)
          ? CachedNetworkImage(
              imageUrl: imageURL!,
              fit: boxFit ?? BoxFit.cover,
              color: color,
              placeholder: showPlaceholder
                  ? (context, url) => SizedBox(
                        child: Shimmer.fromColors(
                          baseColor: AppColors.shimmerStartColor,
                          highlightColor: AppColors.shimmerHighlightColor,
                          child: Container(
                            color: Colors.grey,
                          ),
                        ),
                      )
                  : null,
              errorWidget: (context, url, error) => (customErrorWidget ?? errorWidget()),
            )
          : (customErrorWidget ?? errorWidget()),
    );
  }

  Container errorWidget() {
    return Container(
      color: Colors.grey[100],
      alignment: Alignment.center,
      child: Icon(
        Icons.image_not_supported_outlined,
        color: Colors.grey[400],
      ),
    );
  }
}
