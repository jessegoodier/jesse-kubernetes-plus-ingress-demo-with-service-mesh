sudo docker run -d \
  --restart=always \
  --name registry \
  -v $PWD/nginx-service-mesh:/certs \
  -e REGISTRY_HTTP_ADDR=0.0.0.0:443 \
  -e REGISTRY_HTTP_TLS_CERTIFICATE=/certs/fullchain1.pem \
  -e REGISTRY_HTTP_TLS_KEY=/certs/privkey1.pem \
  -p 444:443 \
  registry:2