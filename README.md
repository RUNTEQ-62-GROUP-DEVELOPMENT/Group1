# チーム開発の運用

## 環境構築

以下の手順で実行してください。

### 初回

```
# 『VSCodeの』ターミナルにて実行

# Docker Appの起動をお忘れなく！

①  docker compose build

②  docker compose up

③  docker compose run web bundle install

④  docker compose run web yarn install

# ①〜④とは別のターミナルにて実行

⑤  docker compose exec web rails db:create

# ①〜『⑤』とは別の新しいターミナルにて実行

⑥  docker compose exec web bin/dev
```

### 2回目以降（または再起動時）

```
# 『VSCodeの』ターミナルにて実行

# Docker Appの起動をお忘れなく！

①  docker compose up
（または docker compose restart）

# ①とは別のターミナルにて実行

②  docker compose exec web bin/dev
```

## push 前にやること

### Lint チェック

push する前にローカル環境で Lint エラーがないか以下のコマンドを実行して
Lint エラーがないことを確認して push ください。

```
docker compose exec web bundle exec rubocop
```

### mainブランチ の変更分をローカル環境へ

自分が main から作業ブランチを切った後に main に merge された内容を
pull してから push してください。
作業内容は以下の通りです。(switch は checkout でも可)

```
git switch main
git pull origin main
git switch 作業ブランチ（feature/00_setting など）
git merge main
```

## プルリクエストについて

作業者、レビュアー、merge 者の役割は以下の通りです。

| 作業者                                                       | レビュアー                                                                                                                         | merge 者                                                                                          |
| ------------------------------------------------------------ | ---------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------- |
| PR（プルリクエスト） を作成し、レビュアー 2 人から LGTM がもらえるまで作業実施 | PR をレビューして問題なければ LGTM、改善点があればその内容をコメント。
また 2 人目の LGTM を出す人は同時に main ブランチへ merge | その際に該当箇所の作業ブランチを削除 |
