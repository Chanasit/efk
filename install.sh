kubectl create namespace logs
helm install elasticsearch elastic/elasticsearch \
  --version=7.17.1 \
  --namespace=logs \
  -f elasticsearch-values.yaml

helm install fluent-bit fluent/fluent-bit \
  --namespace=logs \
  -f fluent-bit-values.yaml

# helm install fluentd fluent/fluentd \
#   --version=0.3.5 \
#   --namespace=logs \
#   -f fluentd-values.yaml

helm install kibana elastic/kibana \
  --version=7.17.1 \
  --namespace=logs \
  --set service.type=NodePort \
  --set service.nodePort=31000 \
  -f kibana-values.yaml
