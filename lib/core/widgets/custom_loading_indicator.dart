import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({super.key, this.height, this.circular});
  final double? height;
  final bool? circular;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
            height: height,
            decoration: BoxDecoration(
              shape: circular == true? BoxShape.circle: BoxShape.rectangle,
                color: Colors.white,
                borderRadius: circular == true? null:
                BorderRadius.circular(5))));
  }
}