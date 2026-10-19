import 'package:flutter/material.dart';
import 'package:flutter_project/core/constants/constants.dart';

/// 各機能で共通して使う、画面実装前のプレースホルダー。
class SkeletonScreen extends StatelessWidget {
  const SkeletonScreen({
    required this.title,
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$title${AppConstants.screenTitleSuffix}',
            style: const TextStyle(
              fontSize: AppConstants.fontSizeHeading,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: AppConstants.spacingSmall),
          Text(
            AppConstants.mainAreaPlaceholder,
            style: const TextStyle(
              fontSize: AppConstants.fontSizeBody,
              color: AppConstants.secondaryTextColor,
            ),
          ),
        ],
      ),
    );
  }
}
