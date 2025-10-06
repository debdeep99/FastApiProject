FROM python:3.10-slim

ENV PYTHONUNBUFFERED True

WORKDIR /usr/src/app

COPY . ./

RUN apt-get update && apt-get install -y libpq-dev build-essential

RUN pip install --no-cache-dir -r requirements.txt

CMD ["fastapi", "run", "main.py", "--port", "80"]