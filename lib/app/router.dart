// 処理フロー: app.dart -> このファイル -> route_paths.dart と
// main_layout_screen.dart。
// URLはroute_paths.dartから参照し、対応する画面Widgetを選ぶ。
import 'package:flutter/material.dart';
import 'package:flutter_project/app/main_layout_screen.dart';
import 'package:flutter_project/app/route_paths.dart';
import 'package:flutter_project/core/constants/constants.dart';
import 'package:flutter_project/features/auth/presentation/pages/auth_page.dart';
import 'package:flutter_project/features/kansa/presentation/pages/kansa_page.dart';
import 'package:flutter_project/features/review/presentation/pages/review_page.dart';
import 'package:flutter_project/features/teian/presentation/pages/teian_page.dart';

/// URL形式のパスと、表示する画面Widgetの対応を管理する。
class AppRouter {
  //外部からインスタンス化されないようにするプライベートコンストラクタ
  //画面遷移の情報はすべてstaticで参照するため、インスタンス化は不要
  AppRouter._();

  /// [MaterialApp] に渡す画面一覧。画面追加時はここにパスを登録する。
  static Map<String, WidgetBuilder> get routes => {
        RoutePaths.home: (_) => const MainLayoutScreen(
              currentTitle: AppConstants.needsAction,
              currentParentCategory: AppConstants.proposalList,
              content: TeianPage(title: AppConstants.needsAction),
            ),
        RoutePaths.needsAction: (_) => const MainLayoutScreen(
              currentTitle: AppConstants.needsAction,
              currentParentCategory: AppConstants.proposalList,
              content: TeianPage(title: AppConstants.needsAction),
            ),
        RoutePaths.inProgress: (_) => const MainLayoutScreen(
              currentTitle: AppConstants.inProgress,
              currentParentCategory: AppConstants.proposalList,
              content: TeianPage(title: AppConstants.inProgress),
            ),
        RoutePaths.completed: (_) => const MainLayoutScreen(
              currentTitle: AppConstants.completed,
              currentParentCategory: AppConstants.proposalList,
              content: TeianPage(title: AppConstants.completed),
            ),
        RoutePaths.proposalSearch: (_) => const MainLayoutScreen(
              currentTitle: AppConstants.proposalSearch,
              content: TeianPage(title: AppConstants.proposalSearch),
            ),
        RoutePaths.notifications: (_) => const MainLayoutScreen(
              currentTitle: AppConstants.notifications,
              content: ReviewPage(title: AppConstants.notifications),
            ),
        RoutePaths.administration: (_) => const MainLayoutScreen(
              currentTitle: AppConstants.administration,
              content: KansaPage(title: AppConstants.administration),
            ),
        RoutePaths.notificationSettings: (_) => const MainLayoutScreen(
              currentTitle: AppConstants.notificationSettings,
              currentParentCategory: AppConstants.settings,
              content: AuthPage(title: AppConstants.notificationSettings),
            ),
        RoutePaths.userSettings: (_) => const MainLayoutScreen(
              currentTitle: AppConstants.userSettings,
              currentParentCategory: AppConstants.settings,
              content: AuthPage(title: AppConstants.userSettings),
            ),
      };
}

//役割はURL形式のパスと表示する画面の対応付け
//material.dart：WidgetBuilderなど、Flutterの画面構築に必要な機能を読み込む
//main_laylut_screen.dart：このルートで表示する画面のWidgetを読み込む
//route_paths.dart：画面のパスを一元管理。ホーム画面のURLはRoutePatjs.homeとして定義
