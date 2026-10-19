// 処理フロー: main_layout_screen.dart -> このファイル -> widgets/app_sidebar.dart。
// 受け取った画面情報と操作コールバックを共通レイアウトとして表示する。
import 'package:flutter/material.dart';
import 'package:flutter_project/app/route_paths.dart';
import 'package:flutter_project/core/constants/constants.dart';
import 'package:flutter_project/shared/widgets/app_sidebar.dart';

/// 共通画面枠のレイアウトを表示するStatelessWidget。
class MainLayoutView extends StatelessWidget {
  const MainLayoutView({
    required this.scaffoldKey,
    required this.currentTitle,
    required this.currentParentCategory,
    required this.content,
    required this.isDesktop,
    required this.sidebarWidth,
    required this.isSidebarExpanded,
    required this.onNavigate,
    required this.onMenuPressed,
    super.key,
  });

  final GlobalKey<ScaffoldState> scaffoldKey;
  final String currentTitle;
  final String currentParentCategory;
  final Widget content;
  final bool isDesktop;
  final double sidebarWidth;
  final bool isSidebarExpanded;
  final void Function(
    String title, {
    String parentCategory,
    required String routePath,
  }) onNavigate;
  final VoidCallback onMenuPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: _MainLayoutAppBar(
        currentTitle: currentTitle,
        currentParentCategory: currentParentCategory,
        isDesktop: isDesktop,
        isSidebarExpanded: isSidebarExpanded,
        onNavigate: onNavigate,
        onMenuPressed: onMenuPressed,
      ),
      // 広い画面ではドロワーを作らず、本文を暗くする幕も表示しない。
      drawer: isDesktop
          ? null
          : Drawer(
              child: AppSidebar(
                currentTitle: currentTitle,
                onNavigate: onNavigate,
              ),
            ),
      body: Row(
        children: [
          if (isDesktop && isSidebarExpanded)
            SizedBox(
              width: sidebarWidth,
              child: Material(
                color: Theme.of(context).colorScheme.surface,
                child: AppSidebar(
                  currentTitle: currentTitle,
                  onNavigate: onNavigate,
                ),
              ),
            ),
          Expanded(
            child: Container(
              color: AppConstants.contentBackgroundColor,
              child: content,
            ),
          ),
        ],
      ),
    );
  }
}

class _MainLayoutAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _MainLayoutAppBar({
    required this.currentTitle,
    required this.currentParentCategory,
    required this.isDesktop,
    required this.isSidebarExpanded,
    required this.onNavigate,
    required this.onMenuPressed,
  });

  final String currentTitle;
  final String currentParentCategory;
  final bool isDesktop;
  final bool isSidebarExpanded;
  final void Function(
    String title, {
    String parentCategory,
    required String routePath,
  }) onNavigate;
  final VoidCallback onMenuPressed;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          InkWell(
            onTap: () => onNavigate(
              AppConstants.needsAction,
              parentCategory: AppConstants.proposalList,
              routePath: RoutePaths.needsAction,
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppConstants.spacingSmall,
                vertical: AppConstants.spacingExtraSmall,
              ),
              child: Text(
                AppConstants.appName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: AppConstants.fontSizeTitle,
                ),
              ),
            ),
          ),
          const SizedBox(width: AppConstants.spacingSmall),
          IconButton(
            icon: Icon(
              isDesktop && isSidebarExpanded ? Icons.menu_open : Icons.menu,
            ),
            tooltip: isDesktop
                ? (isSidebarExpanded
                    ? AppConstants.closeSidebar
                    : AppConstants.openSidebar)
                : AppConstants.openMenu,
            onPressed: onMenuPressed,
          ),
          const SizedBox(width: AppConstants.spacingMedium),
          Expanded(
            child: _Breadcrumbs(
              currentTitle: currentTitle,
              currentParentCategory: currentParentCategory,
            ),
          ),
        ],
      ),
      automaticallyImplyLeading: false,
    );
  }
}

class _Breadcrumbs extends StatelessWidget {
  const _Breadcrumbs({
    required this.currentTitle,
    required this.currentParentCategory,
  });

  final String currentTitle;
  final String currentParentCategory;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          const Text(
            AppConstants.home,
            style: TextStyle(
              fontSize: AppConstants.fontSizeSmall,
              color: AppConstants.secondaryTextColor,
            ),
          ),
          const _BreadcrumbSeparator(),
          if (currentParentCategory.isNotEmpty) ...[
            Text(
              currentParentCategory,
              style: const TextStyle(
                fontSize: AppConstants.fontSizeSmall,
                color: AppConstants.secondaryTextColor,
              ),
            ),
            const _BreadcrumbSeparator(),
          ],
          Text(
            currentTitle,
            style: const TextStyle(
              fontSize: AppConstants.fontSizeSmall,
              fontWeight: FontWeight.bold,
              color: AppConstants.currentPageTextColor,
            ),
          ),
        ],
      ),
    );
  }
}

class _BreadcrumbSeparator extends StatelessWidget {
  const _BreadcrumbSeparator();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppConstants.spacingExtraSmall,
      ),
      child: Text(
        AppConstants.breadcrumbSeparator,
        style: TextStyle(
          fontSize: AppConstants.fontSizeSmall,
          color: AppConstants.secondaryTextColor,
        ),
      ),
    );
  }
}
