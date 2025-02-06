# App Go

## Running locally

Requirements:
You must have Go installed

Run:
```
go run main.go
```

Navigate to localhost:8080 in browser

## Building image simples

```
docker build -t steh/app-multi-stage:simples -f Dockerfile.simples .
```

## Run
```
docker container run -d -p 8080:8080 steh/app-multi-stage:simples
```

## Building image multistage
```
docker build -t steh/app-multi-stage:multi-stage -f Dockerfile.multistage .
```

## Run
```
docker container run -d -p 8181:8080 steh/app-multi-stage:multi-stage
```

## Analyze image history
```
docker history <IMAGE_ID>
```

