# `wagtail-example-ja`

![Wagtail Welcome Page](https://raw.githubusercontent.com/gh640/wagtail-example-ja/main/assets/wagtail-welcome-page.png)

Django ベースの CMS Wagtail をお手軽に試すための Docker イメージです。

- [Wagtail CMS](https://wagtail.io/)

## 必須

- Docker 20.10.7 以上
- Docker Compose 2.0.0-beta.6 以上

※ GitHub Codespaces を使う場合これらは不要です

## 使い方

まずこのリポジトリをチェックアウトするか GitHub Codespaces で開きます。

続いて Docker イメージを作成します。

```bash
docker compose build
```

イメージを使ったコンテナを走らせます。

```bash
docker compose up -d
```

`runserver` でサーバーが立ち上がるのでブラウザでサイトにアクセスして確認します。

URL:

- ローカルのマシンの場合: `http://localhost:8000`
- GitHub Codespaces の場合: `https://${CODESPACE_NAME}-8000.githubpreview.dev`

管理画面にはパス `/admin` からアクセスできます。

![Wagtail Japanese Admin Page](https://raw.githubusercontent.com/gh640/wagtail-example-ja/main/assets/wagtail-admin-page-japanese.png)

デフォルトで利用できる superuser のユーザー名・パスワードは次のとおりです。

- ユーザー名: `root`
- パスワード: `password`

これらのユーザー名・パスワードとメールアドレスはイメージのビルド時に `--build-arg` で変更できます。

`docker-compose.yml` でセットする場合のイメージ:

```yaml
version: "3"

services:
  app:
    build: 
      context: .
      args:
        DJANGO_SUPERUSER_USERNAME: doraemon
        DJANGO_SUPERUSER_EMAIL: example@example.com
        DJANGO_SUPERUSER_PASSWORD: bokudoraemon
    ports:
      - "8000:8000"
```

使い終わったらコンテナを終了します。

```bash
docker compose down
```

すべて使い終わったらイメージを削除します。

```bash
docker image rm wagtail-example-ja_app
```

## 動作確認時のバージョン

動作確認は以下のバージョンで行いました。

- Wagtail 2.14
- Django 3.2
- Python 3.9
