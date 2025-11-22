import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl:
          'https://skzbelzesdrnxhsthsat.supabase.co/storage/v1/object/public/$imageUrl',
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(image: DecorationImage(image: imageProvider)),
      ),
      errorWidget: (context, url, error) => Container(
        color: Colors.grey.shade300,
        child: const Icon(Icons.broken_image, size: 40),
      ),
    );
  }
}
