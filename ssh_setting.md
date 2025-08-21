双方向通信用にサーバーごとに ED25519 鍵ペアを作る場合の手順を整理するとこんな感じ。

---

## 前提

* サーバーA ↔ サーバーB 双方向通信
* エージェント転送は使えない
* 各サーバーに秘密鍵を置き、相手に公開鍵を設置する

---

## 1. サーバーA から B に接続する用の鍵（A側に秘密鍵）

### ローカルで生成（Aサーバー上でも可）

```bash
ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519_to_B
# パスフレーズは任意
```

* `id_ed25519_to_B` が秘密鍵
* `id_ed25519_to_B.pub` が公開鍵

### 公開鍵をサーバーBに設置

```bash
ssh-copy-id -i ~/.ssh/id_ed25519_to_B.pub user@serverB
```

* これで A から B に秘密鍵を使って接続可能

---

## 2. サーバーB から A に接続する用の鍵（B側に秘密鍵）

### Bサーバーで生成

```bash
ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519_to_A
```

* `id_ed25519_to_A` が秘密鍵
* `id_ed25519_to_A.pub` が公開鍵

### 公開鍵をサーバーAに設置

```bash
ssh-copy-id -i ~/.ssh/id_ed25519_to_A.pub user@serverA
```

---

## 3. 接続確認

### A → B

```bash
ssh -i ~/.ssh/id_ed25519_to_B user@serverB
```

### B → A

```bash
ssh -i ~/.ssh/id_ed25519_to_A user@serverA
```

---

## 4. 権限確認（どちらも）

```bash
chmod 600 ~/.ssh/id_ed25519_to_B
chmod 600 ~/.ssh/id_ed25519_to_A
chmod 600 ~/.ssh/authorized_keys
chmod 700 ~/.ssh
```

---

### ポイント

* 鍵は **発信側のサーバーに秘密鍵、受信側に公開鍵**
* 鍵を専用に分けることで、片方が漏洩してももう片方には影響しない
* 双方向通信の安全性を確保しつつ管理もしやすい

---
