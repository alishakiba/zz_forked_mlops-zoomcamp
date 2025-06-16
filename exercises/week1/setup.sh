#!/bin/bash
# Downloading the dataset
!wget https://d37ci6vzurychx.cloudfront.net/trip-data/yellow_tripdata_2021-01.parquet
!wget https://d37ci6vzurychx.cloudfront.net/trip-data/yellow_tripdata_2021-02.parquet
!wget https://d37ci6vzurychx.cloudfront.net/trip-data/green_tripdata_2021-01.parquet
!wget https://d37ci6vzurychx.cloudfront.net/trip-data/green_tripdata_2021-02.parquet
# Moving them into the appropriate folders
!mv yellow_tripdata_2021-01.parquet ../data/
!mv yellow_tripdata_2021-02.parquet ../data/
!mv green_tripdata_2021-01.parquet ../data/
!mv green_tripdata_2021-02.parquet ../data/
# Running mlflow
mlflow ui --backend-store-uri sqlite:///mlflow.db
# Running mlflow to track locally - single developer
mlflow ui --backend-store-uri sqlite:///mlflow.db --default-artifact-root ./artifacts
######################################

# mlflow.dockerfile

FROM python:3.10-slim

RUN pip install mlflow

EXPOSE 5000

CMD [ \
    "mlflow", "server", \
    "--backend-store-uri", "sqlite:///home/mlflow_data/mlflow.db", \
    "--host", "0.0.0.0", \
    "--port", "5000" \
]

# docker-compose.yaml
mlflow:
    build:
        context: .
        dockerfile: mlflow.dockerfile
    ports:
        - "5000:5000"
    volumes:
        - "${PWD}/mlflow_data:/home/mlflow_data/"

