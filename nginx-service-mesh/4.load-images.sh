sudo docker load < nginx-service-mesh/nginx-mesh-images-0.6.0/nginx-mesh-api-0.6.0.tar.gz
sudo docker load < nginx-service-mesh/nginx-mesh-images-0.6.0/nginx-mesh-init-0.6.0.tar.gz
sudo docker load < nginx-service-mesh/nginx-mesh-images-0.6.0/nginx-mesh-metrics-0.6.0.tar.gz
sudo docker load < nginx-service-mesh/nginx-mesh-images-0.6.0/nginx-mesh-sidecar-0.6.0.tar.gz

tag=0.6.0
registry=$1:444
for image in "nginx-mesh-api:${tag}" "nginx-mesh-sidecar:${tag}" "nginx-mesh-init:${tag}" "nginx-mesh-metrics:${tag}"; do
  sudo docker tag "${image}" "${registry}/${image}"
  sudo docker push "${registry}/${image}"
done