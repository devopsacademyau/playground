FROM docker

RUN apk --no-cache update \
    && apk --no-cache upgrade \
    && apk --no-cache add --upgrade make git bash

CMD [ "bash" ]