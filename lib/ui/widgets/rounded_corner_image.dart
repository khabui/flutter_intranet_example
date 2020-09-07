import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_intranet_example/resources/icons.dart';

class RoundedCornerImageWidget extends StatelessWidget {
  final String imageUrl;

  const RoundedCornerImageWidget({@required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return imageUrl != null
        ? CachedNetworkImage(
            imageUrl: imageUrl,
            imageBuilder: (context, imageProvider) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
            placeholder: (context, url) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
            errorWidget: (context, url, error) {
              return const Icon(AppIcons.errorIcon);
            },
          )
        : const Icon(AppIcons.errorIcon);
  }
}
