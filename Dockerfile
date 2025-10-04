FROM python:3.9

WORKDIR /FastApiProject

COPY ./requirements.txt /FastApiProject/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./FastApiProject /FastApiProject/main.py

CMD ["fastapi", "run", "main.py", "--port", "80"]