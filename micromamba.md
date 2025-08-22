# MICROMAMBA導入手順

## インストール

スクリプトからインストール
```shell
curl -sSL micro.mamba.pm/install.sh | bash
```

実行時出力
```
Running `shell init`, which:
 - modifies RC file: "/home/detlem/.bashrc"
 - generates config for root prefix: "/home/detlem/micromamba"
 - sets mamba executable to: "/home/detlem/.local/bin/micromamba"
The following has been added in your "/home/detlem/.bashrc" file

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'micromamba shell init' !!
export MAMBA_EXE='/home/detlem/.local/bin/micromamba';
export MAMBA_ROOT_PREFIX='/home/detlem/micromamba';
__mamba_setup="$("$MAMBA_EXE" shell hook --shell bash --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    alias micromamba="$MAMBA_EXE"  # Fallback on help from micromamba activate
fi
unset __mamba_setup
# <<< mamba initialize <<<

Please restart your shell to activate micromamba or run the following:\n
  source ~/.bashrc (or ~/.zshrc, ~/.xonshrc, ~/.config/fish/config.fish, ...)
```

確認
```shell
which micromamba
```

出力
```
/home/detlem/.local/bin/micromamba
```

## 仮想環境の追加

仮想環境の追加 (Python version: 3.13, 仮想環境名: myenv)
```shell
micromamba create -n myenv python=3.13
```

出力
```
nodefaults/linux-64                                125.0 B @ 213.0 B/s  0.5s
nodefaults/noarch                                   ??.?MB @  ??.?MB/s  0.9s
conda-forge/noarch                                  21.8MB @   2.8MB/s  7.8s
conda-forge/linux-64                                45.9MB @   3.5MB/s 12.9s


Transaction

  Prefix: /home/detlem/micromamba/envs/myenv

  Updating specs:

   - python=3.13


  Package              Version  Build               Channel          Size
───────────────────────────────────────────────────────────────────────────
  Install:
───────────────────────────────────────────────────────────────────────────

  + _libgcc_mutex          0.1  conda_forge         conda-forge       3kB
  + _openmp_mutex          4.5  2_gnu               conda-forge      24kB
  + bzip2                1.0.8  h4bc722e_7          conda-forge     253kB
  + ca-certificates   2025.8.3  hbd8a1cb_0          conda-forge     154kB
  + ld_impl_linux-64      2.44  h1423503_1          conda-forge     676kB
  + libexpat             2.7.1  hecca717_0          conda-forge      75kB
  + libffi               3.4.6  h2dba641_1          conda-forge      57kB
  + libgcc              15.1.0  h767d61c_4          conda-forge     824kB
  + libgcc-ng           15.1.0  h69a702a_4          conda-forge      29kB
  + libgomp             15.1.0  h767d61c_4          conda-forge     447kB
  + liblzma              5.8.1  hb9d3cd8_2          conda-forge     113kB
  + libmpdec             4.0.0  hb9d3cd8_0          conda-forge      91kB
  + libsqlite           3.50.4  h0c1763c_0          conda-forge     933kB
  + libuuid             2.38.1  h0b41bf4_0          conda-forge      34kB
  + libzlib              1.3.1  hb9d3cd8_2          conda-forge      61kB
  + ncurses                6.5  h2d0b736_3          conda-forge     892kB
  + openssl              3.5.2  h26f9b46_0          conda-forge       3MB
  + pip                   25.2  pyh145f28c_0        conda-forge       1MB
  + python              3.13.5  hec9711d_102_cp313  conda-forge      33MB
  + python_abi            3.13  8_cp313             conda-forge       7kB
  + readline               8.2  h8c095d6_2          conda-forge     282kB
  + tk                  8.6.13  noxft_hd72426e_102  conda-forge       3MB
  + tzdata               2025b  h78e105d_0          conda-forge     123kB

  Summary:

  Install: 23 packages

  Total download: 46MB

───────────────────────────────────────────────────────────────────────────


Confirm changes: [Y/n] Y

Transaction starting
pip                                                  1.2MB @   1.1MB/s  0.9s
ncurses                                            891.6kB @   1.7MB/s  0.5s
libsqlite                                          932.6kB @ 581.1kB/s  1.5s
libgcc                                             824.2kB @   1.3MB/s  0.6s
openssl                                              3.1MB @   1.4MB/s  2.1s
ld_impl_linux-64                                   676.0kB @ 782.0kB/s  0.8s
libgomp                                            447.3kB @ 951.0kB/s  0.5s
readline                                           282.5kB @ 719.9kB/s  0.3s
tk                                                   3.3MB @   1.3MB/s  2.5s
tzdata                                             123.0kB @ 566.4kB/s  0.2s
ca-certificates                                    154.4kB @ 566.5kB/s  0.2s
bzip2                                              252.8kB @ 665.2kB/s  0.3s
liblzma                                            112.9kB @ 457.3kB/s  0.2s
libmpdec                                            91.2kB @  30.7kB/s  0.1s
libexpat                                            74.8kB @  ??.?MB/s  0.1s
libzlib                                             61.0kB @ 154.1kB/s  0.1s
libffi                                              57.4kB @ 194.4kB/s  0.1s
libuuid                                             33.6kB @  ??.?MB/s  0.1s
_openmp_mutex                                       23.6kB @ 145.9kB/s  0.1s
libgcc-ng                                           29.2kB @  ??.?MB/s  0.1s
python_abi                                           7.0kB @  28.5kB/s  0.1s
_libgcc_mutex                                        2.6kB @  ??.?MB/s  0.1s
python                                              33.3MB @   3.4MB/s  9.6s
Linking ld_impl_linux-64-2.44-h1423503_1
Linking libgomp-15.1.0-h767d61c_4
Linking _libgcc_mutex-0.1-conda_forge
Linking _openmp_mutex-4.5-2_gnu
Linking libgcc-15.1.0-h767d61c_4
Linking libmpdec-4.0.0-hb9d3cd8_0
Linking ncurses-6.5-h2d0b736_3
Linking libzlib-1.3.1-hb9d3cd8_2
Linking liblzma-5.8.1-hb9d3cd8_2
Linking libgcc-ng-15.1.0-h69a702a_4
Linking libffi-3.4.6-h2dba641_1
Linking libexpat-2.7.1-hecca717_0
Linking readline-8.2-h8c095d6_2
Linking libsqlite-3.50.4-h0c1763c_0
Linking tk-8.6.13-noxft_hd72426e_102
Linking bzip2-1.0.8-h4bc722e_7
Linking libuuid-2.38.1-h0b41bf4_0
Linking python_abi-3.13-8_cp313
Linking tzdata-2025b-h78e105d_0
Linking ca-certificates-2025.8.3-hbd8a1cb_0
Linking openssl-3.5.2-h26f9b46_0
Linking python-3.13.5-hec9711d_102_cp313
Linking pip-25.2-pyh145f28c_0

Transaction finished


To activate this environment, use:

    micromamba activate myenv

Or to execute a single command in this environment, use:

    micromamba run -n myenv mycommand
```

出力を順番に整理するとこんな感じ
---

### 1. チャンネルの取得

```
nodefaults/linux-64       125.0 B @ 213.0 B/s
nodefaults/noarch          ??.?MB @  ??.?MB/s
conda-forge/noarch         21.8MB @   2.8MB/s
conda-forge/linux-64       45.9MB @   3.5MB/s
```

* Micromamba はパッケージを **チャンネル（リポジトリ）** から取得する
* `linux-64` や `noarch` はアーキテクチャ別のパッケージディレクトリ
* ここでは Conda-Forge チャンネルから Python 3.13 を含む依存パッケージをダウンロードしている

---

### 2. トランザクション概要

```
Prefix: /home/detlem/micromamba/envs/myenv
Updating specs: - python=3.13
Install: 23 packages
Total download: 46MB
```

* `Prefix` → 仮想環境のインストール先
* `Updating specs` → 作成する環境で解決するパッケージ要求
* `Install` → ダウンロード・インストールされるパッケージ数
* `Total download` → 合計サイズ

---

### 3. 確認と開始

```
Confirm changes: [Y/n] Y
Transaction starting
```

* ユーザーに **ダウンロードとインストールを実行していいか確認**
* `Y` で開始

---

### 4. ダウンロード状況

```
pip 1.2MB @ 1.1MB/s 0.9s
ncurses 891.6kB @ 1.7MB/s 0.5s
...
```

* パッケージごとにサイズと速度を表示
* 仮想環境内に順次ダウンロードされる

---

### 5. リンク（リンク処理）

```
Linking ld_impl_linux-64-2.44-h1423503_1
Linking libgomp-15.1.0-h767d61c_4
...
Linking python-3.13.5-hec9711d_102_cp313
Linking pip-25.2-pyh145f28c_0
```

* ダウンロードしたパッケージを **仮想環境内に配置・リンク**
* ライブラリ、バイナリ、設定ファイルを環境内に整列

---

### 6. 完了と使い方案内

```
Transaction finished
To activate this environment, use:
    micromamba activate myenv
Or to execute a single command in this environment, use:
    micromamba run -n myenv mycommand
```

* 仮想環境作成完了の通知
* **アクティベート方法** と **一時的にコマンドだけ実行する方法** が表示される

---

💡 **まとめ**

1. チャンネルからパッケージを取得
2. トランザクションの概要表示
3. ユーザー確認後にダウンロード開始
4. 仮想環境内にパッケージをリンクして配置
5. 完了後、仮想環境をアクティベートして使用

---

要するに **Python と依存ライブラリを丸ごと仮想環境に閉じ込める処理** が順を追って表示されている感じ

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
```

---

💡 **ポイントまとめ**

* Micromamba は **軽量でユーザー権限でも使える Conda 互換の環境管理ツール**
* 環境ごとに Python と依存ライブラリを丸ごと隔離
* YAML による再現性や `run` コマンドで一時実行も可能
* システム環境や他の仮想環境に影響せず安全に開発可能

---


