ARG BUILD_FROM
FROM $BUILD_FROM


# Execute during the build of the image
ARG TEMPIO_VERSION BUILD_ARCH
RUN \
    curl https://my-netdata.io/kickstart.sh > /tmp/netdata-kickstart.sh && sh /tmp/netdata-kickstart.sh --no-updates --stable-channel --disable-telemetry --dont-start-it --non-interactive

# Copy data for add-on
COPY rootfs /

EXPOSE 19999

CMD [ "/usr/bin/run.sh" ]