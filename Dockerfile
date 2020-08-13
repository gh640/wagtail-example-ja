FROM python:3

WORKDIR /app

ARG DJANGO_SUPERUSER_USERNAME=root
ARG DJANGO_SUPERUSER_EMAIL=example@example.com
ARG DJANGO_SUPERUSER_PASSWORD=password

RUN pip install -U pip && \
  pip install wagtail && \
  wagtail start mysite . && \
  pip install -r requirements.txt && \
  python manage.py migrate && \
  python manage.py createsuperuser --noinput

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
