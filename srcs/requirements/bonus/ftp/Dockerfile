FROM debian:bullseye

RUN mkdir -p /var/run/vsftpd/empty

RUN apt-get update && \
    apt-get install -y vsftpd && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY ./conf/vsftpd.conf /etc/vsftpd.conf

COPY ./tools/script.sh .

EXPOSE 20 21

RUN chmod +x ./script.sh

CMD ["./script.sh"]