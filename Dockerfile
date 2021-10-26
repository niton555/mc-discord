FROM debian:stable-20210902-slim

ENV username="minecraftbot" \
	webhookurl="url"

RUN apt-get update && apt-get install -y \
curl

CMD /bin/bash