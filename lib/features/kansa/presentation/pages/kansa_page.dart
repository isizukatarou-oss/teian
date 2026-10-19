import 'package:flutter/material.dart';
import 'package:flutter_project/shared/widgets/skeleton_screen.dart';

/// 監査機能の画面スケルトン。
class KansaPage extends StatelessWidget {
  const KansaPage({
    required this.title,
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) => SkeletonScreen(title: title);
}
