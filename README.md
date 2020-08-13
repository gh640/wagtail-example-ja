# `wagtail-example-ja`

Django ベースの CMS Wagtail をお手軽に試すための Docker イメージです。

- [Wagtail CMS](https://wagtail.io/)

## 使い方

Docker イメージを作成します。

```bash
. init.sh
```

`init.sh` を実行すると `wagtail` という名前のイメージが作成されます。

続いてこのイメージを走らせます。

```bash
. run.sh
```

`runserver` でサーバーが立ち上がるので http://localhost:8000 にアクセスして確認します。
管理画面は http://localhost:8000/admin で確認できます。

試し終わったら <kbd>ctrl + c</kbd> 等で終了します。

使い終わったら `wagtail` イメージを削除します。

```bash
docker image rm wagtail
```

イメージを作成するときに superuser が作成されますが、その名前・メールアドレス・パスワードを変更したいときは `--build-arg` を使います。

```bash
docker build -t wagtail -f Dockerfile --build-arg DJANGO_SUPERUSER_USERNAME=doraemon .
```

利用可能な引数は次のとおりです。

- `DJANGO_SUPERUSER_USERNAME`: ユーザー名
- `DJANGO_SUPERUSER_EMAIL`: メールアドレス
- `DJANGO_SUPERUSER_PASSWORD`: パスワード

参考:

- [Using ARG variables | Dockerfile reference | Docker Documentation](https://docs.docker.com/engine/reference/builder/#using-arg-variables)

## 前提条件

Wagtail ・ Django ・ Python が以下のバージョンのときに動作確認をしています。

- Wagtail 2.10
- Django 3.1
- Python 3.x
