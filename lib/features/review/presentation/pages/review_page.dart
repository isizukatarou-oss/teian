import 'package:flutter/material.dart';
import 'package:flutter_project/shared/widgets/skeleton_screen.dart';

/// レビュー機能の画面スケルトン。
class ReviewPage extends StatelessWidget {
  const ReviewPage({
    required this.title,
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) => SkeletonScreen(title: title);
}
