// 参照元: app.dart、theme.dart、main_layout_screen.dart、
// shared/widgets/app_sidebar.dart。
// URLパスはroute_paths.dartで管理し、それ以外のアプリ共通定数をここにまとめる。
import 'package:flutter/material.dart';

/// アプリで複数のファイルから使う値を一元管理する。
class AppConstants {
  AppConstants._();

  // アプリ情報
  static const appTitle = 'Flutter FastAPI Web App';
  static const appName = 'アプリ名';

  // 画面・メニュー名
  static const home = 'ホーム';
  static const proposalList = '提案一覧';
  static const needsAction = '要対応';
  static const inProgress = '処理中';
  static const completed = '完了・終了';
  static const proposalSearch = '提案検索';
  static const notifications = 'お知らせ';
  static const administration = '事務局';
  static const settings = '設定';
  static const notificationSettings = '通知設定';
  static const userSettings = '利用者設定';
  static const menu = 'メニュー';
  static const openSidebar = 'サイドバーを開く';
  static const closeSidebar = 'サイドバーを閉じる';
  static const openMenu = 'メニューを開く';
  static const breadcrumbSeparator = '>';
  static const noParentCategory = '';

  // 仮の画面を表示するときに使う文言
  static const screenTitleSuffix = ' 画面';
  static const mainAreaPlaceholder = 'ここがメインエリアです';

  // レイアウト幅
  static const desktopBreakpoint = 520.0;
  static const compactSidebarBreakpoint = 720.0;
  static const compactSidebarWidth = 220.0;
  static const sidebarWidth = 280.0;

  // アプリ共通の色
  static const primaryColor = Colors.blue;
  static const sidebarHeaderTextColor = Colors.white;
  static const secondaryTextColor = Color(0xFF757575);
  static const currentPageTextColor = Color(0xDD000000);
  static const contentBackgroundColor = Color(0xFFF5F5F5);

  // 余白・インデント
  static const spacingExtraSmall = 4.0;
  static const spacingSmall = 8.0;
  static const spacingMedium = 12.0;
  static const sidebarItemIndent = 32.0;

  // 文字サイズ
  static const fontSizeSmall = 14.0;
  static const fontSizeBody = 16.0;
  static const fontSizeTitle = 20.0;
  static const fontSizeHeading = 24.0;
}
