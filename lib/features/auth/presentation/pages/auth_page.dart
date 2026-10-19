import 'package:flutter/material.dart';
import 'package:flutter_project/shared/widgets/skeleton_screen.dart';

/// 認証機能の画面スケルトン。
class AuthPage extends StatelessWidget {
  const AuthPage({
    required this.title,
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) => SkeletonScreen(title: title);
}
