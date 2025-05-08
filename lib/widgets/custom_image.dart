import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double? height;
  final double borderRadius;
  const CustomImage(
      {super.key,
      required this.imageUrl,
      required this.width,
      this.height,
      required this.borderRadius});

  String _secureUrl(String url) =>
      url.replaceFirst(RegExp(r'^http:'), 'https:');

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Image.network(
        _secureUrl(imageUrl),
        width: width,
        height: height,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }
          return Container(
            color: Colors.grey.shade300,
            width: width,
            height: height,
            child: Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        (loadingProgress.expectedTotalBytes ?? 1)
                    : null,
                strokeWidth: 3,
              ),
            ),
          );
        },
        errorBuilder: (context, error, stackTrace) => Container(
          width: width,
          height: height,
          color: Colors.grey.shade300,
          child: const Icon(
            Icons.image_not_supported,
            size: 40,
          ),
        ),
      ),
    );
  }
}
