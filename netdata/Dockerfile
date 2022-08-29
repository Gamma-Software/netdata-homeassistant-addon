ARG BUILD_FROM

FROM netdata/netdata:v1.36.1 AS netdata_build
WORKDIR /

FROM $BUILD_FROM
LABEL maintainer="valentin.rudloff.perso@gmail.com"

#COPY --from=netdata_build /usr/sbin/run.sh /usr/sbin/run.sh
#COPY --from=netdata_build /usr/sbin/netdata* /usr/sbin/
#COPY --from=netdata_build /etc/netdata /etc/netdata
#COPY --from=netdata_build /var/lib/netdata* /var/lib
COPY --from=netdata_build / /

# Install openssl to claim node
RUN apk update &&\
    apk add openssl

# Execute during the build of the image
#RUN curl https://my-netdata.io/kickstart.sh > /tmp/netdata-kickstart.sh && \
#    sh /tmp/netdata-kickstart.sh --no-updates --stable-channel \
#    --disable-telemetry --dont-start-it --non-interactive

# Copy data for add-on
COPY rootfs /

EXPOSE 19999
CMD [ "/usr/bin/run.sh" ]