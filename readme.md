
Build TF image from Dockerfile here

Download fluentd image from: docker pull fluent/fluentd:edge


docker run --rm --name fluentd -p 24224:24224 -v /home/alan/ado/zxtonow/tf.cont/fluent:/fluentd/etc -e FLUENTD_CONF=fluentd.conf fluent/fluentd:edge

docker run --rm --log-driver=fluentd --log-opt tag=docker.{{.Name}} --name tf tf.cont /usr/local/bin/terraform


docker swarm init
docker stack deploy --compose-file docker-compose.yml bob

docker events : to see what's happening!
docker stats  : to see what's happening


use <stack>_<service> as host name for connectivity:
e.g. in Grafana add http://bob_prometheus:9090/ as source
