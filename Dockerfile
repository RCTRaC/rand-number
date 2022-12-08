ARG image
FROM $image
COPY . /app
WORKDIR /app
RUN touch requirements.txt && pip install -r requirements.txt
ENTRYPOINT ["python", "main.py"]
