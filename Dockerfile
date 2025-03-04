FROM --platform=$BUILDPLATFORM golang:1.23 AS build
ARG TARGETPLATFORM
ARG OTEL_VERSION
WORKDIR /app
COPY ./manifest.yaml .
RUN go install go.opentelemetry.io/collector/cmd/builder@v${OTEL_VERSION}
RUN CGO_ENABLED=0 builder --config=manifest.yaml

FROM alpine:latest AS prep
RUN apk --update add ca-certificates

FROM scratch
ARG USER_UID=10001
ARG USER_GID=10001
USER ${USER_UID}:${USER_GID}
COPY --from=prep /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt
COPY --from=build /app/dist/otelcol /
COPY ./config.yaml /etc/otel/
EXPOSE 4317 55680 55679
ENTRYPOINT ["/otelcol"]
CMD ["--config", "/etc/otel/config.yaml"]
