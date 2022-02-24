FROM golang:1.17-bullseye as build

WORKDIR /app
ADD . /app

RUN go get -d -v ./...

RUN go build -o /hello

FROM gcr.io/distroless/base-debian11
COPY --from=build /hello /

CMD [ "/hello" ]
