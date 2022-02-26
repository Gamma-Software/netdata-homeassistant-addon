ARG BUILD_FROM
FROM $BUILD_FROM

ARG BUILD_DATE
LABEL org.opencontainers.image.version=$BUILD_DATE


EXPOSE 19999

# Execute during the build of the image
RUN curl https://my-netdata.io/kickstart.sh > /tmp/netdata-kickstart.sh && \
    sh /tmp/netdata-kickstart.sh --no-updates --stable-channel \
    --disable-telemetry --dont-start-it --non-interactive

# Check the integrity of the installation
RUN [ "373053d7b715af0d9c30e479a6c53809" = "$(curl -Ss https://my-netdata.io/kickstart.sh | md5sum | cut -d ' ' -f 1)" ] && exit 1 || true

# Copy data for add-on
COPY rootfs /

CMD [ "/usr/bin/run.sh" ]