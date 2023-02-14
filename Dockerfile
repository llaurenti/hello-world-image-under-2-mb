FROM golang AS builder
WORKDIR /
ADD ./fromscratchgohelloworld.go /fromscratchgohelloworld.go
RUN ["go", "build", "/fromscratchgohelloworld.go"]

FROM scratch
COPY --from=builder /fromscratchgohelloworld /fromscratchgohelloworld

CMD ["/fromscratchgohelloworld"]