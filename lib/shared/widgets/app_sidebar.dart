// 処理フロー: app/main_layout_screen.dart -> このファイル -> メニュー操作を通知。
// 選択された項目はコールバックで共通画面枠へ返す。
import 'package:flutter/material.dart';
import 'package:flutter_project/core/constants/constants.dart';

/// 現在の画面を選択状態で示し、メニュー選択を画面枠へ通知する。
class AppSidebar extends StatelessWidget {
  const AppSidebar({
    required this.currentTitle,
    required this.onNavigate,
    super.key,
  });

  /// サイドバーで選択状態として表示する画面名。
  final String currentTitle;

  /// 選択した画面名と、パンくず用の親カテゴリを画面枠へ渡すコールバック。
  final void Function(String title, {String parentCategory}) onNavigate;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(color: AppConstants.primaryColor),
          child: Text(
            AppConstants.menu,
            style: TextStyle(
              color: AppConstants.sidebarHeaderTextColor,
              fontSize: AppConstants.fontSizeHeading,
            ),
          ),
        ),
        ExpansionTile(
          leading: const Icon(Icons.list_alt),
          title: const Text(AppConstants.proposalList),
          initiallyExpanded: true,
          children: [
            ListTile(
              contentPadding: const EdgeInsets.only(
                left: AppConstants.sidebarItemIndent,
              ),
              title: const Text(AppConstants.needsAction),
              selected: currentTitle == AppConstants.needsAction,
              onTap: () => onNavigate(
                AppConstants.needsAction,
                parentCategory: AppConstants.proposalList,
              ),
            ),
            ListTile(
              contentPadding: const EdgeInsets.only(
                left: AppConstants.sidebarItemIndent,
              ),
              title: const Text(AppConstants.inProgress),
              selected: currentTitle == AppConstants.inProgress,
              onTap: () => onNavigate(
                AppConstants.inProgress,
                parentCategory: AppConstants.proposalList,
              ),
            ),
            ListTile(
              contentPadding: const EdgeInsets.only(
                left: AppConstants.sidebarItemIndent,
              ),
              title: const Text(AppConstants.completed),
              selected: currentTitle == AppConstants.completed,
              onTap: () => onNavigate(
                AppConstants.completed,
                parentCategory: AppConstants.proposalList,
              ),
            ),
          ],
        ),
        ListTile(
          leading: const Icon(Icons.search),
          title: const Text(AppConstants.proposalSearch),
          onTap: () => onNavigate(AppConstants.proposalSearch),
        ),
        ListTile(
          leading: const Icon(Icons.notifications),
          title: const Text(AppConstants.notifications),
          onTap: () => onNavigate(AppConstants.notifications),
        ),
        ListTile(
          leading: const Icon(Icons.business),
          title: const Text(AppConstants.administration),
          onTap: () => onNavigate(AppConstants.administration),
        ),
        const Divider(),
        ExpansionTile(
          leading: const Icon(Icons.settings),
          title: const Text(AppConstants.settings),
          initiallyExpanded: true,
          children: [
            ListTile(
              contentPadding: const EdgeInsets.only(
                left: AppConstants.sidebarItemIndent,
              ),
              title: const Text(AppConstants.notificationSettings),
              selected: currentTitle == AppConstants.notificationSettings,
              onTap: () => onNavigate(
                AppConstants.notificationSettings,
                parentCategory: AppConstants.settings,
              ),
            ),
            ListTile(
              contentPadding: const EdgeInsets.only(
                left: AppConstants.sidebarItemIndent,
              ),
              title: const Text(AppConstants.userSettings),
              selected: currentTitle == AppConstants.userSettings,
              onTap: () => onNavigate(
                AppConstants.userSettings,
                parentCategory: AppConstants.settings,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
