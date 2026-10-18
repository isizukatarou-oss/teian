// 処理フロー: app.dart -> このファイル -> ThemeDataをMaterialAppへ返す。
// アプリ共通の見た目をここで定義し、画面側から独立させる。
import 'package:flutter/material.dart';
import 'package:flutter_project/core/constants/constants.dart';

/// アプリ全体で共有するテーマを定義する。
class AppTheme {
  AppTheme._();

  /// 青を基調にしたMaterial 3のライトテーマ。
  static final light = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: AppConstants.primaryColor),
    useMaterial3: true,
  );
}
