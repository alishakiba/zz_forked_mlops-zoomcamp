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