# prometheus-armv7-raspi

## Summary

Docker <a href="https://prometheus.io">Prometheus</a> image, based on arm32v6/alpine. Tested working on Raspberry Pi 3 / Stretch.
Base image size is roughly 204 MB.
Based off of https://github.com/ajeetraina/prometheus-armv7

## Usage

- Customize the included prometheus.yml as applicable
- docker build -t prometheus/rpi-mon .
- docker run -p 9090:9090 --name prometheus-rpi -d prometheus/rpi-mon

 ## License

This is open-sourced software licensed under the [MIT license](http://opensource.org/licenses/MIT).
