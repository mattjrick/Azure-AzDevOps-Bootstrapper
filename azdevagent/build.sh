docker build -t azdevagent:latest .
az login
az acr login --name <your_acr_name>
docker tag azdevagent:latest <your_acr_name>/azdevagent
docker push