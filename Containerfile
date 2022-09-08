FROM rust:1-buster

RUN apt update
RUN apt install -y golang
RUN git clone https://github.com/nmstate/nmstate
RUN cd nmstate && make clib
RUN apt install -y python3-setuptools
RUN cd nmstate && make install
COPY go.mod .
COPY go.sum .
COPY main.go .
RUN go mod download
RUN go build main.go

