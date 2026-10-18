// 処理フロー: main.dart -> このファイル -> theme.dart、route_paths.dart、
// router.dart。
// URLをroute_paths.dartから受け取り、画面生成はrouter.dartに委譲する。
import 'package:flutter/material.dart';
import 'package:flutter_project/app/router.dart';
import 'package:flutter_project/app/route_paths.dart';
import 'package:flutter_project/app/theme.dart';
import 'package:flutter_project/core/constants/constants.dart';

/// アプリ全体で共通するテーマと画面遷移を [MaterialApp] に設定する。
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appTitle,
      // 色や部品の見た目をアプリ全体で統一する。
      theme: AppTheme.light,
      // 最初に開く画面と、画面名からWidgetへの対応をRouterに任せる。
      initialRoute: RoutePaths.home,
      routes: AppRouter.routes,
    );
  }
}

//役割はFlutterアプリ全体の設定を行う
//MyAppはStatelessWidgetを継承しており、状態を持たないWidgetとして定義
//const MyApp({super.key})はコンストラクタで、super.keyは親クラスのStatelessWidgetのkeyを初期化するための指定
//build()はWidgetの描画内容を返すメソッドで、ここではMaterialAppを返す
//MaterialAppはFlutterのマテリアルデザインアプリの基本構造を提供するWidget
//titleはアプリのタイトルを設定するプロパティで、OSのタスク切り替え画面などに表示される
//themeはアプリ全体のテーマを設定するプロパティで、AppTheme.lightを指定している
//initialRouteはアプリ起動時に最初に表示する画面のルート名を指定し、route_paths.dartのRoutePaths.homeを使う
//routesは画面名とWidgetの対応を定義するプロパティで、AppRouter.routesを指定している
