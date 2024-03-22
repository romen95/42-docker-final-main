FROM golang:1.22

WORKDIR /project

COPY go.mod go.sum ./

RUN go mod download

COPY *.go ./

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /my_project

CMD ["/my_project"]