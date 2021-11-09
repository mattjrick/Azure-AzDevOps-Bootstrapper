docker build -t azdevagent:latest .
az login
az acr login --name mattrsacr
docker tag azdevagent:latest mattrsacr.azurecr.io/azdevagent
docker push