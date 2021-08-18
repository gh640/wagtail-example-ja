FROM python:3

WORKDIR /app

ARG DJANGO_SUPERUSER_USERNAME=root
ARG DJANGO_SUPERUSER_EMAIL=example@example.com
ARG DJANGO_SUPERUSER_PASSWORD=password
ARG WAGTAIL_APP_DIR=mysite

# 利用パッケージをインストール
RUN pip install -U pip && \
  pip install wagtail

# セットアップ
RUN wagtail start "${WAGTAIL_APP_DIR}" . && \
  pip install -r requirements.txt && \
  python manage.py migrate && \
  python manage.py createsuperuser --noinput

# 設定
# - 言語: 日本語
# - タイムゾーン: 東京
RUN sed --in-place "s/^LANGUAGE_CODE = .*/LANGUAGE_CODE = 'ja-jp'/" mysite/settings/base.py && \
  sed --in-place "s/TIME_ZONE = .*/TIME_ZONE = 'Asia\/Tokyo'/" mysite/settings/base.py

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
