FROM alpine:latest
RUN apk add --no-cache git cgit lighttpd mailcap highlight md4c mandoc && highlight --print-style --stdout >> /usr/share/webapps/cgit/cgit.css && mkdir -p /var/cache/cgit && chown lighttpd:lighttpd /var/cache/cgit
COPY cgitrc lighttpd.conf /etc/
COPY about-formatting.sh syntax-highlighting.sh /usr/lib/cgit/filters/
USER lighttpd
EXPOSE 8080
CMD ["lighttpd", "-Df", "/etc/lighttpd.conf"]
