curl -X PUT "localhost:9200/_index_template/logstash?pretty" -H 'Content-Type: application/json' -d'
{
  "index_patterns": ["logstash-*"],
  "template": {
    "settings": {
      "index": {
        "lifecycle": {
          "name": "7-days-default",
          "rollover_alias": "logstash"
        },
        "number_of_replicas": "2"
      }
    },
    "mappings": {
      "dynamic": "true",
      "properties": {}
    },
    "aliases": {
      "logstash": {}
    }
  },
  "priority": 500,
  "data_stream": { },
  "composed_of": ["data-streams-mappings"],
  "version": 1.0,
  "_meta": {
    "description": "logstash from fluent-bit",
    "managed": true
  }
}
'
