tag=0.6.0
registry=$1:444
nginx-meshctl deploy --registry-server $registry \
    --nginx-mesh-api-image "nginx-mesh-api:$tag" \
    --nginx-mesh-sidecar-image "nginx-mesh-sidecar:$tag" \
    --nginx-mesh-init-image "nginx-mesh-init:$tag" \
    --nginx-mesh-metrics-image "nginx-mesh-metrics:$tag" \
    --prometheus-address "k8s.nginx.rocks:9090"

