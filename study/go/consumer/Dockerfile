FROM golang:1.23.0

WORKDIR /app

COPY go.mod .

RUN go mod download
RUN go mod tidy

COPY . /app

RUN go build .

CMD ["go", "run", "main.go"]
