ARG BUILD_FROM
FROM $BUILD_FROM


# Execute during the build of the image
ARG TEMPIO_VERSION BUILD_ARCH
RUN \
    curl https://my-netdata.io/kickstart.sh > /tmp/netdata-kickstart.sh && sh /tmp/netdata-kickstart.sh --no-updates --stable-channel --disable-telemetry --dont-start-it --non-interactive

# Check the integrity of the installation
RUN [ "373053d7b715af0d9c30e479a6c53809" = "$(curl -Ss https://my-netdata.io/kickstart.sh | md5sum | cut -d ' ' -f 1)" ] && echo "OK, VALID" || echo "FAILED, INVALID"

# Copy data for add-on
COPY rootfs /

EXPOSE 19999

CMD [ "/usr/bin/run.sh" ]