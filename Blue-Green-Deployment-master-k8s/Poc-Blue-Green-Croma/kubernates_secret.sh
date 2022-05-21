#!/bin/sh

#Kubernates Cluster Information
ResourceGrouName=blue-green
ClusterName=blue-green-k8s

#Azure Container Registry Information
AcrServer=omnistoreimages.azurecr.io
AcrUserName=omnistoreimages
AcrPassword=xeY=A0lNYrSSv7L8akH1jtwzpar7FbN6

#Storage account information
StorageAccountName=csb1003200094f9c116
StorageAccountKey=023RtIjG2Jz58sOhz67vBoXNQKHAAqe+we6qpdbuv9Yz6syw7DlEWoOyThfQUFae+IZFzVrrWrhr8zfa6Ewlyg==

#connect to the Kubernates_Cluster
az aks get-credentials --resource-group $ResourceGrouName --name $ClusterName --overwrite-existing

#create secret for azure storage account
kubectl create secret generic microservice --from-literal=azurestorageaccountname=$StorageAccountName --from-literal=azurestorageaccountkey=$StorageAccountKey


#Create secret for container registry image pull
kubectl create secret docker-registry imagepull --namespace default --docker-server=$AcrServer --docker-username=$AcrUserName --docker-password=$AcrPassword

