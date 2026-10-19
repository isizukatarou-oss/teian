// URL定義の参照元: app.dart と router.dart。
// 画面のURLを変更・追加するときは、ここでパスを一元管理する。

/// アプリ内で使用するURL形式のパスを管理する。
class RoutePaths {
  RoutePaths._();

  /// アプリ起動時に表示するホーム画面のパス。
  static const home = '/';

  // 提案機能
  static const needsAction = '/teian/needs-action';
  static const inProgress = '/teian/in-progress';
  static const completed = '/teian/completed';
  static const proposalSearch = '/teian/search';

  // 各機能の画面
  static const notifications = '/review/notifications';
  static const administration = '/kansa/administration';
  static const notificationSettings = '/auth/notification-settings';
  static const userSettings = '/auth/user-settings';
}
