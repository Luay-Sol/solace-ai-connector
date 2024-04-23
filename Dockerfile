FROM python:3.10-slim

WORKDIR /app

RUN apt-get update && \
    apt-get install -y git && \
    apt-get clean

#Install main program
COPY . /app
RUN python3.10 -m pip install -r requirements.txt
ENV PYTHONUNBUFFERED=1

LABEL org.opencontainers.image.source https://github.com/SolaceLabs/solace-ai-connector

# Run app.py when the container launches
ENTRYPOINT ["python", "src/main.py"]
