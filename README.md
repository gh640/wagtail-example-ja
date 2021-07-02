# `wagtail-example-ja`

![Wagtail Welcome Page](https://raw.githubusercontent.com/gh640/wagtail-example-ja/main/assets/wagtail-welcome-page.png)

Django ベースの CMS Wagtail をお手軽に試すための Docker イメージです。

- [Wagtail CMS](https://wagtail.io/)

## 必須

- Docker 20.10.7 以上
- Docker Compose 1.9 以上

## 使い方

Docker イメージを作成します。

```bash
docker compose build
```

イメージを使ったコンテナを走らせます。

```bash
docker compose up -d
```

`runserver` でサーバーが立ち上がるので http://localhost:8000 にアクセスして確認します。
管理画面は http://localhost:8000/admin で確認できます。

試し終わったら <kbd>ctrl + c</kbd> 等で終了します。

使い終わったらコンテナを終了します。

```bash
docker compose down
```

すべて使い終わったらイメージを削除します。

```bash
docker image rm wagtail-example-ja_app
```

イメージを作成するときに superuser が作成されますが、その名前・メールアドレス・パスワードを変更したいときは `--build-arg` を使います。

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

利用可能な引数は次のとおりです。

- `DJANGO_SUPERUSER_USERNAME`: ユーザー名
- `DJANGO_SUPERUSER_EMAIL`: メールアドレス
- `DJANGO_SUPERUSER_PASSWORD`: パスワード

参考:

- [Using ARG variables | Dockerfile reference | Docker Documentation](https://docs.docker.com/engine/reference/builder/#using-arg-variables)

## 前提条件

Wagtail ・ Django ・ Python が以下のバージョンのときに動作確認をしています。

- Wagtail 2.13
- Django 3.2
- Python 3.9
