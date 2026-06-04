# OpenTelemetry Collector Splunk HEC Distro

This distribution contains the components from both the [OpenTelemetry Collector](https://github.com/open-telemetry/opentelemetry-collector) repository and the [OpenTelemetry Collector Contrib](https://github.com/open-telemetry/opentelemetry-collector-contrib) repository required to tail log files with the [Filelog Receiver](https://github.com/open-telemetry/opentelemetry-collector-contrib/tree/main/receiver/filelogreceiver) and ship them to Splunk via the [Splunk HEC Exporter](https://github.com/open-telemetry/opentelemetry-collector-contrib/tree/main/exporter/splunkhecexporter). Logs are also emitted to stdout through the debug exporter.

## Components

The full list of components is available in the [manifest](manifest.yaml).
