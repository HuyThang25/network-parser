# BUILD
```
docker build -t network-parser .
```

# USAGE
```
docker run -v $PWD:/data -it network-parser

network-parser -p /data/my_pcap.pcap --proto=ssh --popt keyfile=/data/keys.json -o /tmp/ssh/ -s 

```
[Docker hub](https://hub.docker.com/r/huythang25/network-parser)
