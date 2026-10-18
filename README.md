# Flutter Project

Flutter アプリケーションです。

現在のプロジェクトはWeb向けです。Android、iOS、Linux、macOS、Windows向けのFlutterプラットフォームファイルは含めていません。

## ディレクトリ構成

```text
lib/
├── main.dart
├── app/                       # アプリの基盤と全体レイアウト
│   ├── app.dart
│   ├── router.dart
│   ├── route_paths.dart       # URL形式の画面パス
│   ├── theme.dart
│   └── main_layout_screen.dart
├── core/                # ネットワーク、エラー、定数、共通ユーティリティ
│   └── constants/
│       └── constants.dart   # URL以外の共通定数
├── shared/              # 複数featureで再利用するウィジェット、拡張、モデル
│   └── widgets/
│       └── app_sidebar.dart    # 機能間で共有するサイドバーUI
└── features/
    ├── auth/            # 認証機能
    ├── teian/           # 提案機能
    ├── review/          # レビュー機能
    └── kansa/           # 監査機能
```

各 feature は `presentation/`、`domain/`、`data/` に分け、画面・ビジネスロジック・データアクセスを整理します。アプリの起動・ルーティング・テーマと全体レイアウトは基盤として `app/` に置きます。複数featureから使う共通UIやモデルは `shared/` に置きます。

## コーディングルール

- 本番コードに、意味のある数値・色・共通表示文言・設定値を直接埋め込まない（マジックナンバー／ハードコーディング禁止）。
- アプリ全体で使う値は `core/constants/constants.dart`、URLパスは `app/route_paths.dart` に定義する。特定featureだけで使う値は、そのfeatureの定数ファイルに定義する。
- 数値は用途が名前から分かる定数名にする。単なるリテラルの移動ではなく、利用範囲に合った場所に置く。
- テスト内の期待値・画面サイズなど、検証対象を明示するためのリテラルは例外とする。これらを本番コードの定数で置き換えて検証を弱めない。

## 実行方法

プロジェクトのルートで以下を実行してください。

```sh
flutter pub get
flutter run -d chrome
```
