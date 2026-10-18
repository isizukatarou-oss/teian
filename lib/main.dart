// 処理フロー: Flutter起動 -> [MyApp] -> app/app.dart。
// このファイルでは起動処理だけを行い、設定は次のファイルに委譲する。
import 'package:flutter/widgets.dart';
import 'package:flutter_project/app/app.dart';

/// Flutterの起動地点。アプリ全体の設定は [MyApp] に任せる。
void main() {
  runApp(const MyApp());
}

//役割としてはFlutterアプリのエントリーポイントであり、画面内容や業務処理は行わない
//main()はアプリ起動時にFlutterが最初に呼び出す関数
//runApp(...)はFlutterに「このWidgetを起点として表示して」と伝える
//MyAppはapp.dartに定義されていて、テーマや画面ルートなどのアプリ全体の設計を担当
//constは可能な場合にWidgetを再利用できるようにする指定
//widgets.dartはrunAppなど、Flutterの基本的なWidget APIを提供するパッケージ
