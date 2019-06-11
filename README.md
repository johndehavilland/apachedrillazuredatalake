# Apache Drill Container with Azure Data Lake Store connector

This is repo that contains a dockerfile for running Apache Drill with a storage plugin configured for Azure Data Lake Store.

## Docker Commands
docker build -t johndh/drill .

docker run -i -p 8047:8047 -p 31010:31010 -t johndh/drill bin/bash

## Running Commands

Here are a couple of example queries to get started:

```
SHOW FILES FROM `datalake`;
```
```
SELECT * FROM datalake.`parquet/userdata1.parquet`
```

## Connecting to PowerBI
1. Make sure to install the MapR ODBC driver.
2. Under ODBC, leave the top dropdown alone and under advanced enter the following:

`driver={MapR Drill ODBC Driver};connectiontype=Direct;host=localhost;port=31010;authenticationtype=No Authentication`

3. Make sure to choose *No Credentials* and, if all is good you should be able to view your data.

read more details on my blog post: 