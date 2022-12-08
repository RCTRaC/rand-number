FROM python:3.9
COPY . /app
WORKDIR /app
RUN touch requirements.txt && pip install -r requirements.txt
ENTRYPOINT ["python", "main.py"]
