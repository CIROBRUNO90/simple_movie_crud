FROM golang:latest AS builder

WORKDIR /first_crud

COPY go.mod go.sum ./
RUN go mod download

COPY . /first_crud/
RUN CGO_ENABLED=0 GOOS=linux go build -o main .

FROM alpine:latest  

RUN apk --no-cache add ca-certificates
WORKDIR /root/

COPY --from=builder /first_crud/main .

COPY --from=builder /first_crud/.env .

EXPOSE 8080

CMD ["./main"]