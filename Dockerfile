FROM alpine:latest
RUN apk add --no-cache git cgit lighttpd mailcap md4c highlight mandoc
RUN mkdir -p /var/cache/cgit
COPY cgitrc /etc/
COPY lighttpd.conf /etc/lighttpd/
COPY about-formatting.sh syntax-highlighting.sh /usr/lib/cgit/filters/
RUN highlight --print-style --stdout >> /usr/share/webapps/cgit/cgit.css
EXPOSE 80
CMD ["lighttpd", "-Df", "/etc/lighttpd/lighttpd.conf"]
