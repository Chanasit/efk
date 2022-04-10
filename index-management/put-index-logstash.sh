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
        "number_of_replicas": "1"
      }
    },
    "mappings": {
      "dynamic": "true",
      "dynamic_date_formats": [
        "strict_date_optional_time",
        "yyyy/MM/dd HH:mm:ss Z||yyyy/MM/dd Z"
      ],
      "dynamic_templates": [
      ],
      "date_detection": true,
      "numeric_detection": false,
      "properties": {
        "@timestamp": {
          "type": "date"
        },
        "data_stream": {
          "properties": {
            "dataset": {
              "type": "constant_keyword"
            },
            "namespace": {
              "type": "constant_keyword"
            }
          }
        },
        "ecs": {
          "properties": {
            "version": {
              "type": "keyword",
              "ignore_above": 1024
            }
          }
        },
        "host": {
          "type": "object"
        }
      }
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
