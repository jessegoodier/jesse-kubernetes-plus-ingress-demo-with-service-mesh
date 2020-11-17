kubectl apply -f kubernetes-ingress/deployments/common/crds
# kubectl apply -f kubernetes-ingress/deployments/common/crds-v1beta1
kubectl apply -f kubernetes-ingress/deployments/common/ns-and-sa.yaml
kubectl apply -f kubernetes-ingress/deployments/rbac/rbac.yaml
kubectl apply -f kubernetes-ingress/deployments/rbac/ap-rbac.yaml
kubectl apply -f k8s-apps/nginx-info/7.2-nginx.rocks-cert.yaml -n nginx-ingress
kubectl apply -f kubernetes-ingress/deployments/common/ingress-class.yaml
kubectl apply -f kubernetes-ingress/deployments/common/nginx-config.yaml

# the private registry key is not included in this repo, you need to save your own.
kubectl apply -n nginx-ingress -f docker-regcred.yaml 

if kubectl get secrets -n nginx-ingress|grep regcred; then
   kubectl apply -f kubernetes-ingress/deployments/deployment/nginx-plus-ingress-mesh.yaml;
else   
   RED='\033[0;31m'
   NC='\033[0m' # No Color
   LR='1;31'
   echo '\e[91m No registry creds availible press crtl-c to quit and load your regcred.' \
    'NGINX Plus KIC should be in a private registry: add your regcred '\
    'before installing see options here: \n' \
    'https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/ '\
    'or \n' \
    'kubectl create secret docker-registry regcred --docker-server=<your-registry-server> --docker-username=<your-name> --docker-password=<your-pword> --docker-email=<your-email>\n' \
    'or \n' \
    'kubectl create secret generic regcred --from-file=.dockerconfigjson=$HOME/.docker/config.json --type=kubernetes.io/dockerconfigjson\n' \
    'Press any key to continue, you will need to run the Plus ingress install script again later.'
   read x
   exit;
fi
