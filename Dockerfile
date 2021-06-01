FROM python:3.7

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

COPY ./app /app/app
COPY ./requirements.txt /app
COPY ./alembic.ini /app

WORKDIR /app

RUN pip install -r requirements.txt

EXPOSE 80
EXPOSE 443

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "80"]