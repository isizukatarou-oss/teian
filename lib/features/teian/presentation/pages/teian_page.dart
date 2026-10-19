import 'package:flutter/material.dart';
import 'package:flutter_project/shared/widgets/skeleton_screen.dart';

/// 提案機能の画面スケルトン。
class TeianPage extends StatelessWidget {
  const TeianPage({
    required this.title,
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) => SkeletonScreen(title: title);
}
