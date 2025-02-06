FROM golang:1.18.10 AS build
WORKDIR /build
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o main .

FROM alpine:3.18.4 AS app
WORKDIR /app
COPY --from=steh/package-bin:v1
COPY --from=build /build/main .
CMD ["./main"]