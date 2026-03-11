#!/usr/bin/env python
# coding: utf-8

import pandas as pd
from sqlalchemy import create_engine
from tqdm.auto import tqdm


def run():
    pg_user = 'root'
    pg_pass = 'root'
    pg_host = 'localhost'
    pg_db = 'aegley_db'
    year = 2021
    month = 1
    target_table = 'yellow_taxi_data'
    prefix = 'https://github.com/DataTalksClub/nyc-tlc-data/releases/download/yellow/' 
    url = f'yellow_tripdata_{year}-{month:02d}.csv.gz'  
    engine = create_engine(f'postgresql+psycopg://{pg_user}:{pg_pass}@{pg_host}:5433/{pg_db}')

    pg_user = 'root'
    pg_pass = 'root'
    pg_host = 'localhost'
    pg_db = 'aegley_db'
    year = 2021
    month = 1
    target_table = 'yellow_taxi_data'



    dtype = {
        "VendorID": "Int64",
        "passenger_count": "Int64",
        "trip_distance": "float64",
        "RatecodeID": "Int64",
        "store_and_fwd_flag": "string",
        "PULocationID": "Int64",
        "DOLocationID": "Int64",
        "payment_type": "Int64",
        "fare_amount": "float64",
        "extra": "float64",
        "mta_tax": "float64",
        "tip_amount": "float64",
        "tolls_amount": "float64",
        "improvement_surcharge": "float64",
        "total_amount": "float64",
        "congestion_surcharge": "float64"
    }

    parse_dates = [
        "tpep_pickup_datetime",
        "tpep_dropoff_datetime"
    ]
    chunksize = 100000
    df = pd.read_csv(prefix + url, dtype=dtype, parse_dates=parse_dates)


    df_iter = pd.read_csv(
        prefix + url,
        dtype=dtype,
        parse_dates=parse_dates,
        iterator=True,
        chunksize=100000
    )





    first = True
    for df in tqdm(df_iter):
        if first:
            df.head(n=0).to_sql(
                name = target_table,
                con=engine,
                if_exists='replace'
            )
            first = False
        df.to_sql(name = target_table, con=engine, if_exists='append')



    print(pd.io.sql.get_schema(df,name = target_table, con=engine)) 



if __name__ == '__main__':
        run()


