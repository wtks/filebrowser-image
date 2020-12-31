FROM alpine as alpine
RUN apk --update add ca-certificates mailcap

ENV FILEBROWSER_VERSION v2.11.0

ADD download.sh ./
RUN ./download.sh

FROM scratch
COPY --from=alpine /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt
COPY --from=alpine /etc/mime.types /etc/mime.types
COPY --from=alpine /filebrowser/filebrowser /filebrowser

VOLUME /srv
EXPOSE 80

ENTRYPOINT [ "/filebrowser" ]
