# OpenTelemetry Collector distributions

This repository assembles OpenTelemetry Collector distributions, such as the 'cloudflare logs' distribution.

Each distribution contains:

- Multi-arch container images (linux/arm64 and linux/amd64)
  
More details about each individual distribution can be seen in its own readme files.

Current list of distributions:

- [OpenTelemetry Collector Cloudflare Logs (also known as "otelcol-cloudflare")](./distributions/otelcol-cloudflare)

## Examples

Example manifests for upstream distributions can be found at: https://github.com/open-telemetry/opentelemetry-collector-releases/tree/main/distributions

## Releases

Conventional commits to `distributions/**` trigger the creation of a 'release PR' together with a changelog.

Caveat: changes to `Dockerfile` and `go.*` are not triggering a release PR or included in the changelog for a OTel distribution (see this [question](https://stackoverflow.com/questions/79484918/release-please-github-action-manifest-releaser-to-force-bump-all-packages), or this [issue](https://github.com/googleapis/release-please/pull/2534))

To create the release, including building and publishing of the images, just merge the release PR.
