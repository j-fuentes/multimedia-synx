FROM golang:1.16-bullseye as build

WORKDIR /go/src/app
ADD . /go/src/app

RUN go get -d -v ./...

RUN go build -o /go/bin/multimedia-sync

# Now copy it into our base image.
FROM gcr.io/distroless/base-debian11
COPY --from=build /go/bin/multimedia-sync /
CMD ["/multimedia-sync"]
