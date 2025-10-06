FROM python:3.10-slim-bookworm

RUN apt-get update && apt-get install -y libpq-dev gcc

ENV PYTHONUNBUFFERED True

WORKDIR /usr/src/app
COPY . /usr/src/app

ENV PYTHONPATH "/usr/src/app"

RUN pip install --no-cache-dir -r requirements.txt

CMD ["fastapi", "run", "main.py", "--port", "80"]