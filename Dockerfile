ARG GO_VERSION=1
FROM --platform=$BUILDPLATFORM golang:${GO_VERSION} AS build
ARG TARGETPLATFORM
WORKDIR /app
COPY --from=ocb ./go.* .
COPY ./manifest.yaml .
RUN CGO_ENABLED=0 go tool go.opentelemetry.io/collector/cmd/builder --config=manifest.yaml

FROM alpine:3.23 AS prep
RUN apk --update add ca-certificates

FROM scratch
ARG OTEL_EXECUTABLE
ARG USER_UID=10001
ARG USER_GID=10001
USER ${USER_UID}:${USER_GID}
COPY --from=prep /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt
COPY --from=build /app/dist/${OTEL_EXECUTABLE} /otelcol
COPY ./config.yaml /etc/otel/
EXPOSE 13133
ENTRYPOINT ["/otelcol"]
CMD ["--config", "/etc/otel/config.yaml"]
