FROM python:3.9.16-slim-bullseye
WORKDIR /app
COPY app.py .
RUN pip install --no-cache-dir flask==2.3.2
EXPOSE 80
CMD ["python", "app.py"]
