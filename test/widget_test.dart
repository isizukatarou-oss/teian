// テストフロー: このファイル -> app.dart -> router.dart ->
// main_layout_screen.dart。
// モバイルでの画面遷移と、広い画面でのサイドバー開閉を検証する。
import 'package:flutter/material.dart';
import 'package:flutter_project/app/app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('selecting a menu item updates the main content on mobile', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(400, 800);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const MyApp());

    await tester.tap(find.byIcon(Icons.menu));
    await tester.pumpAndSettle();
    await tester.tap(find.text('提案検索').first);
    await tester.pumpAndSettle();

    expect(find.text('提案検索 画面'), findsOneWidget);
  });

  testWidgets('sidebar routes to each feature skeleton screen', (tester) async {
    tester.view.physicalSize = const Size(1000, 800);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text('処理中').first);
    await tester.pumpAndSettle();
    expect(find.text('処理中 画面'), findsOneWidget);

    await tester.tap(find.text('完了・終了').first);
    await tester.pumpAndSettle();
    expect(find.text('完了・終了 画面'), findsOneWidget);

    await tester.tap(find.text('提案検索').first);
    await tester.pumpAndSettle();
    expect(find.text('提案検索 画面'), findsOneWidget);

    await tester.tap(find.text('要対応').first);
    await tester.pumpAndSettle();
    expect(find.text('要対応 画面'), findsOneWidget);

    await tester.tap(find.text('お知らせ').first);
    await tester.pumpAndSettle();
    expect(find.text('お知らせ 画面'), findsOneWidget);

    await tester.tap(find.text('事務局').first);
    await tester.pumpAndSettle();
    expect(find.text('事務局 画面'), findsOneWidget);

    await tester.tap(find.text('通知設定').first);
    await tester.pumpAndSettle();
    expect(find.text('通知設定 画面'), findsOneWidget);

    await tester.tap(find.text('利用者設定').first);
    await tester.pumpAndSettle();
    expect(find.text('利用者設定 画面'), findsOneWidget);
  });

  testWidgets('desktop sidebar stays beside the content without a barrier', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(600, 800);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const MyApp());

    expect(find.text('メニュー'), findsOneWidget);
    expect(find.text('ここがメインエリアです'), findsOneWidget);
    expect(find.byType(Drawer), findsNothing);
    final expandedContentCenter = tester.getCenter(find.text('ここがメインエリアです')).dx;
    expect(expandedContentCenter, greaterThan(400));

    await tester.tap(find.byTooltip('サイドバーを閉じる'));
    await tester.pumpAndSettle();

    expect(find.text('メニュー'), findsNothing);
    expect(find.text('ここがメインエリアです'), findsOneWidget);
    expect(find.byType(Drawer), findsNothing);
    final collapsedContentCenter =
        tester.getCenter(find.text('ここがメインエリアです')).dx;
    expect(collapsedContentCenter, lessThan(320));

    await tester.tap(find.byTooltip('サイドバーを開く'));
    await tester.pumpAndSettle();

    expect(find.text('メニュー'), findsOneWidget);
    expect(find.byType(Drawer), findsNothing);
  });
}
