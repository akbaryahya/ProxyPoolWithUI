FROM alpine:3.14.0
WORKDIR /proxy
ADD . /proxy
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories &&\
    apk upgrade --update-cache --available &&\
    apk add build-base python3-dev py3-pip libxml2-dev libxslt-dev &&\
    pip install --upgrade pip &&\
    pip install -r requirements.txt
EXPOSE 5000
CMD ["python3", "main.py"]