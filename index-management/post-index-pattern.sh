curl -X POST "http://localhost:5601/api/index_patterns/index_pattern" -H 'kbn-xsrf: true' -H 'Content-Type: application/json' -d'{"index_pattern":{"title":"logstash-*","timeFieldName":"@timestamp"}}'
