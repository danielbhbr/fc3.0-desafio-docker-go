#Imagem temporaria para o build
FROM golang:latest as builder
RUN mkdir /app
ADD . /app
WORKDIR /app
#RUN rm -f go.mod
#RUN go mod init
#RUN go mod tidy
RUN go build -o main .

#Imagem otimizada para o run
FROM scratch
WORKDIR /app
COPY --from=builder /app/main .
CMD [ "/app/main" ]