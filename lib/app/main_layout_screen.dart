// 処理フロー: router.dart -> このファイル -> main_layout_view.dart と
// widgets/app_sidebar.dart。
// サイドバーからの選択通知を受け、画面遷移とサイドバーの開閉状態を管理する。
import 'package:flutter/material.dart';
import 'package:flutter_project/app/main_layout_view.dart';
import 'package:flutter_project/core/constants/constants.dart';

/// 画面遷移とサイドバーの開閉状態を管理するアプリ共通の画面枠。
class MainLayoutScreen extends StatefulWidget {
  const MainLayoutScreen({
    required this.content,
    this.currentTitle = AppConstants.needsAction,
    this.currentParentCategory = AppConstants.proposalList,
    super.key,
  });

  final Widget content;
  final String currentTitle;
  final String currentParentCategory;

  @override
  State<MainLayoutScreen> createState() => _MainLayoutScreenState();
}

class _MainLayoutScreenState extends State<MainLayoutScreen> {
  bool _isSidebarExpanded = true;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  /// 選択したメニューへ遷移し、同じ画面なら狭い画面のドロワーだけ閉じる。
  void _navigateTo(
    String title, {
    String parentCategory = AppConstants.noParentCategory,
    required String routePath,
  }) {
    if (widget.currentTitle == title &&
        widget.currentParentCategory == parentCategory) {
      if (_scaffoldKey.currentState?.isDrawerOpen ?? false) {
        Navigator.of(context).pop();
      }
      return;
    }

    Navigator.of(context).pushReplacementNamed(routePath);
  }

  void _handleMenuPressed(bool isDesktop) {
    if (isDesktop) {
      setState(() {
        _isSidebarExpanded = !_isSidebarExpanded;
      });
    } else {
      _scaffoldKey.currentState?.openDrawer();
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop =
            constraints.maxWidth >= AppConstants.desktopBreakpoint;
        final sidebarWidth =
            constraints.maxWidth < AppConstants.compactSidebarBreakpoint
                ? AppConstants.compactSidebarWidth
                : AppConstants.sidebarWidth;

        return MainLayoutView(
          scaffoldKey: _scaffoldKey,
          currentTitle: widget.currentTitle,
          currentParentCategory: widget.currentParentCategory,
          content: widget.content,
          isDesktop: isDesktop,
          sidebarWidth: sidebarWidth,
          isSidebarExpanded: _isSidebarExpanded,
          onNavigate: _navigateTo,
          onMenuPressed: () => _handleMenuPressed(isDesktop),
        );
      },
    );
  }
}
