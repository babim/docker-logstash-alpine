docker-logstash-alpine
======================

Alpine Linux based [Logstash](https://www.elastic.co/products/logstash) Docker Image

### Credits
Thanks
* https://github.com/blacktop/docker-logstash-alpine
* https://github.com/docker-library/logstash

### Getting Started

Start Logstash with configuration file

```bash
$ docker run -d -v "$PWD":/config-dir babim/logstash logstash -f /config-dir/logstash.conf
```
Start Logstash with commandline configuration. Download [metricbeat](https://www.elastic.co/downloads/beats/metricbeat)  

```bash
$ docker run -d --name elastic -p 9200:9200 babim/elasticsearch
$ docker run -d --name kibana --link elastic:elasticsearch -p 5601:5601 babim/kibana
$ docker run -d --name logstash -p 5044:5044 --link elastic:elasticsearch babim/logstash \
  logstash -e 'input {
                  beats {
                    port => 5044
                  }
               }

               output {
                 elasticsearch {
                   hosts => "elasticsearch:9200"
                   manage_template => false
                   index => "%{[@metadata][beat]}-%{+YYYY.MM.dd}"
                   document_type => "%{[@metadata][type]}"
                 }
               }'
```
Don't use base image ok :-)
