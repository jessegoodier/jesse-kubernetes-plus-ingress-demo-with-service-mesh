#!/bin/bash -xe
kubectl apply -f k8s-apps/
kubectl apply -f k8s-apps/k8s-dashboard
kubectl apply -f k8s-apps/cafe-complete-example
kubectl create serviceaccount dashboard-admin-sa
kubectl create clusterrolebinding dashboard-admin-sa --clusterrole=cluster-admin --serviceaccount=default:dashboard-admin-sa
echo "use this for the kubernetes dashboard:"
kubectl describe secrets dashboard-admin-sa |grep token:

