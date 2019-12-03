FROM envoyproxy/envoy-alpine

EXPOSE 8080

RUN apk add --no-cache --virtual .build-deps \
    supervisor 
    # tzdata && \
    # cp /usr/share/zoneinfo/Asia/Taipei /etc/localtime \
    # && echo "Asia/Taipei" >  /etc/timezone 
    
COPY ./docker/google_com_proxy.v2.yaml /etc/envoy/envoy.yaml
COPY ./docker/supervisord.conf /etc/supervisor.d/supervisord.ini

CMD /usr/bin/supervisord -n -c /etc/supervisord.conf;