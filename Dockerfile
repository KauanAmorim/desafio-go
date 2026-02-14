FROM golang:1.26.0-alpine AS builder

WORKDIR /usr/src/app
COPY . .
RUN go mod init desafio-fullcycle || true
RUN CGO_ENABLED=0 go build -ldflags="-s -w" -o app .

FROM scratch

COPY --from=builder /usr/src/app/app /app

CMD [ "/app" ]