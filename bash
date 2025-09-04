CURRENT_DIR=$(pwd)
SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

#!/usr/bin/env bash
# setup.sh - プロジェクト開発用セットアップスクリプト
# 使用方法: source setup.sh [options]
# Options:
#   -p, --prefix   インストール先ディレクトリ (default: $HOME/dev/mylib)
#   -a, --alias    エイリアス名 (default: devmylib)
#   -h, --help     このヘルプを表示

set -euo pipefail

# ----------------------------
# デフォルト設定
# ----------------------------
PROJECT_NAME="mylib"
PREFIX="$HOME/dev/$PROJECT_NAME"
ALIAS_NAME="devmylib"
BIN="$PREFIX/bin/$PROJECT_NAME"

# ----------------------------
# 引数パース
# ----------------------------
while [[ $# -gt 0 ]]; do
  case $1 in
    -p|--prefix)
      PREFIX="$2"
      BIN="$PREFIX/bin/$PROJECT_NAME"
      shift 2
      ;;
    -a|--alias)
      ALIAS_NAME="$2"
      shift 2
      ;;
    -h|--help)
      grep '^#' "$0" | sed 's/^#//'
      return 0 2>/dev/null || exit 0
      ;;
    *)
      echo "Unknown option: $1"
      return 1 2>/dev/null || exit 1
      ;;
  esac
done

# ----------------------------
# ビルド＆インストール（未インストール時のみ）
# ----------------------------
if [ ! -f "$BIN" ]; then
  echo "ビルド＆インストールを開始します..."
  mkdir -p "$PREFIX"
  ./configure --prefix="$PREFIX"
  make
  make install
else
  echo "既にビルド済みです。"
fi

# ----------------------------
# エイリアス設定
# ----------------------------
alias $ALIAS_NAME="$BIN"
echo "Alias '$ALIAS_NAME' を設定しました。"

# ----------------------------
# PATH を通したい場合（任意）
# ----------------------------
# export PATH="$PREFIX/bin:$PATH"
# echo "PATH に $PREFIX/bin を追加しました。"

echo "セットアップ完了！ $ALIAS_NAME で実行できます。"
