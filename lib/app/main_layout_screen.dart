// 処理フロー: router.dart -> このファイル -> core/constants/constants.dart と
// widgets/app_sidebar.dart。
// サイドバーからの選択通知を受け、この画面のタイトルやパンくずを更新する。
import 'package:flutter/material.dart';
import 'package:flutter_project/core/constants/constants.dart';
import 'package:flutter_project/shared/widgets/app_sidebar.dart';

/// ヘッダー、ナビゲーション、本文をまとめるアプリ共通の画面枠。
class MainLayoutScreen extends StatefulWidget {
  const MainLayoutScreen({super.key});

  @override
  State<MainLayoutScreen> createState() => _MainLayoutScreenState();
}

class _MainLayoutScreenState extends State<MainLayoutScreen> {
  // ヘッダー、パンくず、選択中のメニュー表示を同じ値から更新する。
  String _currentTitle = AppConstants.needsAction;
  String _currentParentCategory = AppConstants.proposalList;

  // 広い画面でサイドバーを横に表示するかどうか。
  bool _isSidebarExpanded = true;

  // 狭い画面でドロワーを開閉するため、Scaffoldの状態を参照する。
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  /// 選択したメニューを反映し、狭い画面のドロワーは閉じる。
  void _navigateTo(
    String title, {
    String parentCategory = AppConstants.noParentCategory,
  }) {
    setState(() {
      _currentTitle = title;
      _currentParentCategory = parentCategory;
    });

    // 広い画面の固定サイドバーは閉じず、ドロワーだけを閉じる。
    if (_scaffoldKey.currentState?.isDrawerOpen ?? false) {
      Navigator.of(context).pop();
    }
  }

  /// 選択中の画面名を表示する本文領域。
  ///
  /// 各機能の画面が実装された後は、選択された機能の内容に置き換える。
  Widget _buildSelectedContent() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$_currentTitle${AppConstants.screenTitleSuffix}',
            style: const TextStyle(
              fontSize: AppConstants.fontSizeHeading,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: AppConstants.spacingSmall),
          Text(
            AppConstants.mainAreaPlaceholder,
            style: const TextStyle(
              fontSize: AppConstants.fontSizeBody,
              color: AppConstants.secondaryTextColor,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Scaffoldが実際に使える幅に応じて、固定表示かドロワーかを選ぶ。
        final isDesktop =
            constraints.maxWidth >= AppConstants.desktopBreakpoint;

        // 狭いウィンドウでも本文の幅を残せるよう、サイドバーを少し縮める。
        final sidebarWidth =
            constraints.maxWidth < AppConstants.compactSidebarBreakpoint
                ? AppConstants.compactSidebarWidth
                : AppConstants.sidebarWidth;

        return Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            title: Row(
              children: [
                InkWell(
                  onTap: () => _navigateTo(
                    AppConstants.needsAction,
                    parentCategory: AppConstants.proposalList,
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
                    isDesktop && _isSidebarExpanded
                        ? Icons.menu_open
                        : Icons.menu,
                  ),
                  tooltip: isDesktop
                      ? (_isSidebarExpanded
                          ? AppConstants.closeSidebar
                          : AppConstants.openSidebar)
                      : AppConstants.openMenu,
                  onPressed: () {
                    if (isDesktop) {
                      // 広い画面では本文と横並びのまま、サイドバーの幅を切り替える。
                      setState(() {
                        _isSidebarExpanded = !_isSidebarExpanded;
                      });
                    } else {
                      // 狭い画面では本文に重なるドロワーを開く。
                      _scaffoldKey.currentState?.openDrawer();
                    }
                  },
                ),
                const SizedBox(width: AppConstants.spacingMedium),
                Expanded(
                  child: SingleChildScrollView(
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
                        const Padding(
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
                        ),
                        if (_currentParentCategory.isNotEmpty) ...[
                          Text(
                            _currentParentCategory,
                            style: const TextStyle(
                              fontSize: AppConstants.fontSizeSmall,
                              color: AppConstants.secondaryTextColor,
                            ),
                          ),
                          const Padding(
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
                          ),
                        ],
                        Text(
                          _currentTitle,
                          style: const TextStyle(
                            fontSize: AppConstants.fontSizeSmall,
                            fontWeight: FontWeight.bold,
                            color: AppConstants.currentPageTextColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            automaticallyImplyLeading: false,
          ),
          // 広い画面ではドロワーを作らず、本文を暗くする幕も表示しない。
          drawer: isDesktop
              ? null
              : Drawer(
                  child: AppSidebar(
                    currentTitle: _currentTitle,
                    onNavigate: _navigateTo,
                  ),
                ),
          body: Row(
            children: [
              // サイドバーを本文の横に配置するため、本文は残り幅を使う。
              if (isDesktop && _isSidebarExpanded)
                SizedBox(
                  width: sidebarWidth,
                  child: Material(
                    color: Theme.of(context).colorScheme.surface,
                    child: AppSidebar(
                      currentTitle: _currentTitle,
                      onNavigate: _navigateTo,
                    ),
                  ),
                ),
              Expanded(
                child: Container(
                  color: AppConstants.contentBackgroundColor,
                  child: _buildSelectedContent(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
