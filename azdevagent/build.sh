docker build -t azdevagent:latest .
az login
# Fill in your_acr_name e.g. myacraddress
az acr login --name <your_acr_name>
# Fill in your_acr_address e.g. myacraddress.azurecr.io 
docker tag azdevagent:latest <your_acr_address>/azdevagent
docker push