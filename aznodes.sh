#!/bin/bash
#CLUSTERS=$(az aks list -o table | tail -n +3)
#VNET=$(az network vnet list -o table | tail -n +3)
NODES=$(kubectl get nodes | tail -n +2)
echo $NODES | awk '{print $1}'



#IFS=$'\n'

IFS='
'
for item in $VNET; 
do 
  AKS_NAME=$(echo $item | awk '{print $1 }');
  AKS_RG=$(echo $item | awk '{print $2 }');
  echo $AKS_NAME
  az network vnet show -n $AKS_NAME -g $AKS_RG
done

#for Name in $VNET
#do
#   echo $Nume
#   #echo $Name | awk '{print $2}'
#    
#done
