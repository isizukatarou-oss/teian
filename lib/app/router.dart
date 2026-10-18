// 処理フロー: app.dart -> このファイル -> route_paths.dart と
// main_layout_screen.dart。
// URLはroute_paths.dartから参照し、対応する画面Widgetを選ぶ。
import 'package:flutter/material.dart';
import 'package:flutter_project/app/main_layout_screen.dart';
import 'package:flutter_project/app/route_paths.dart';

/// URL形式のパスと、表示する画面Widgetの対応を管理する。
class AppRouter {
  //外部からインスタンス化されないようにするプライベートコンストラクタ
  //画面遷移の情報はすべてstaticで参照するため、インスタンス化は不要
  AppRouter._();

  /// [MaterialApp] に渡す画面一覧。画面追加時はここにパスを登録する。
  static Map<String, WidgetBuilder> get routes => {
        //_はルートから渡される引数だが、この画面では使わないので、省略を示す名前になっている
        RoutePaths.home: (_) => const MainLayoutScreen(),
      };
}

//役割はURL形式のパスと表示する画面の対応付け
//material.dart：WidgetBuilderなど、Flutterの画面構築に必要な機能を読み込む
//main_laylut_screen.dart：このルートで表示する画面のWidgetを読み込む
//route_paths.dart：画面のパスを一元管理。ホーム画面のURLはRoutePatjs.homeとして定義
