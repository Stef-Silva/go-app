FROM golang:1.18.10 AS build
WORKDIR /build
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o main .

FROM build AS package_build
WORKDIR /pkg
COPY --from=steh/package-bin:v1 /pkg/package.bin .

FROM alpine:3.18.4 AS app
WORKDIR /app
COPY --from=build /pkg/package.bin .
COPY --from=build /build/main .
CMD ["./main"]