**Docker commands
docker run -i -p 8047:8047 -t johndh/drill bin/bash

docker build -t johndh/drill .

SHOW FILES FROM `datalake`;

driver={MapR Drill ODBC Driver};connectiontype=Direct;host=localhost;port=31010;authenticationtype=No Authentication

SELECT * FROM datalake.`parquet/userdata1.parquet`



ACR_LOGIN_SERVER=$(az acr show --name jdhcontainerreg --resource-group management --query "loginServer" --output tsv)

az container create \
    --name aci-demo \
    --resource-group management \
    --image $ACR_LOGIN_SERVER/johndh/drill:v1 \
    --registry-login-server $ACR_LOGIN_SERVER \
    --registry-username jdhcontainerreg \
    --registry-password 7HT0LAMQHr9O7hRM7EFTtXKXESmzC=o9 \
    --dns-name-label johndh-drill \
    --query ipAddress.fqdn
