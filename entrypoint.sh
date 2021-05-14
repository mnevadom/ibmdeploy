#!/bin/sh
set -e

CLUSTER_NAME=$1
DEPLOYMENT_FILE=$2
NS=$3


echo "My home is "
echo $HOME

ls

if [ -z $CLUSTER_NAME ]; then
  echo "CLUSTER_NAME is required"
  exit 1
fi

if [ -z $DEPLOYMENT_FILE ]; then
  echo "DEPLOYMENT_FILE is required"
  exit 1
fi

if [ -z $NS ]; then
  echo "Namespace is required"
  exit 1
fi

echo "installing plugin tools for ks"
ibmcloud plugin install container-service

echo "Config cluster files... ibmcloud ks cluster config --cluster $CLUSTER_NAME"
ibmcloud ks cluster config --cluster $CLUSTER_NAME

# Execute the file
echo "KUBERNETES COMMAND:"
echo "kubectl apply -k $DEPLOYMENT_FILE -n $NS"
kubectl apply -k $DEPLOYMENT_FILE -n $NS
echo ""

echo "My home is "
echo $HOME


