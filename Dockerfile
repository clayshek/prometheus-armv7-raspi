FROM arm32v6/alpine
RUN apk add --no-cache curl
WORKDIR /root/
RUN mkdir /root/prometheus

RUN curl -sSLO https://github.com/prometheus/prometheus/releases/download/v2.2.1/prometheus-2.2.1.linux-armv7.tar.gz && \
   tar -xvf prometheus-2.2.1.linux-armv7.tar.gz -C /root/prometheus/ --strip-components=1 && \
   rm prometheus-2.2.1.linux-armv7.tar.gz

WORKDIR /root/prometheus

RUN mkdir -p /usr/share/prometheus
RUN mkdir -p /etc/prometheus
RUN mv ./prometheus /usr/bin/
RUN mv ./promtool /usr/bin/
RUN mv ./console_libraries /usr/share/prometheus/
RUN mv ./consoles /usr/share/prometheus/

RUN ln -s /usr/share/prometheus/console_libraries /etc/prometheus/

EXPOSE 9090
VOLUME [ "/prometheus" ]
WORKDIR /prometheus
ADD ./prometheus.yml /etc/prometheus/prometheus.yml
ENTRYPOINT [ "/usr/bin/prometheus" ]
CMD ["--config.file=/etc/prometheus/prometheus.yml", \
     "--storage.tsdb.path=/prometheus", \
     "--web.console.libraries=/usr/share/prometheus/console_libraries", \
     "--web.console.templates=/usr/share/prometheus/consoles" ]
