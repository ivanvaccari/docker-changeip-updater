FROM debian:buster-slim
ENV TZ Etc/UTC
RUN apt-get update && apt-get install -y curl dnsutils && apt-get autoclean -y
ADD assets /usr/src/app
RUN chmod +x /usr/src/app/rinker.sh
RUN chmod +x /usr/src/app/forever-rinker.sh
WORKDIR /usr/src/app
CMD ["bash", "forever-rinker.sh"]