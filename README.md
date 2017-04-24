# elk-opswork
opswork configuration for ELK

# Work with kafka:

## See current queue state:

```bash
/opt/kafka/bin/kafka-run-class.sh kafka.tools.GetOffsetShell --topic logstash --broker-list localhost:9092
```

## Clean the queue:
```bash
bin/kafka-topics.sh --delete --zookeeper localhost:2181 --topic logstash
```
