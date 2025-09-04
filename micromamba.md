# MICROMAMBA導入手順

## インストール

スクリプトからインストール
```shell
curl -sSL micro.mamba.pm/install.sh | bash
```

## 基本操作

### 仮想環境の作成

```bash
# 新しい環境作成
micromamba create -n myenv python=3.12

# 別チャンネルからパッケージ指定も可能
micromamba create -n myenv -c conda-forge python=3.12 numpy pandas
```

* `-n` : 環境名
* `-c` : チャンネル指定

---

### 環境のアクティベート / ディアクティベート

```bash
micromamba activate myenv
micromamba deactivate
```

* activate すると PATH やライブラリパスがその環境用に切り替わる
* deactivate でシステム環境に戻る

---

### パッケージ管理

```bash
# インストール
micromamba install numpy pandas -n myenv

# アンインストール
micromamba remove numpy -n myenv

# パッケージリスト
micromamba list -n myenv
```

* 環境ごとにパッケージを独立管理

---

### YAML を使った環境再現

```bash
# 環境をファイルに書き出す
micromamba env export -n myenv > myenv.yaml

# 別マシンで再現
micromamba create -f myenv.yaml -n myenv
```

* 複数マシンで同じ環境を再現可能

---

### 仮想環境内でのコマンド実行

```bash
# 一時的に環境を指定してコマンド実行
micromamba run -n myenv python script.py
```

* activate せずに単発コマンドだけ環境内で実行できる

---

### 仮想環境一覧

```bash
micromamba env list
```

* 作成済み環境とそのパスを確認

---

### その他便利コマンド

```bash
# 環境削除
micromamba remove -n myenv --all

# チャンネル情報確認
micromamba info
micromamba config list

micromamba search -c conda-forge numpy
```

---

### トラブルシューティング

```
critical libmamba Shell not initialized
```
* シェルを設定する
  ```
  micromamba shell init --shell bash --root-prefix=~/micromamba
  source ~/.bashrc
  ```
  * --root-prefixはenvs/が保存される場所
  * `micromamba env list`で確認できる
