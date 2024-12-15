FROM		debian:11-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN	apt update \
	&& apt upgrade -y \
	&& apt install -y \
	gcc g++ libgcc1 libc++-dev gdb libc6 git wget curl tar zip \
	unzip binutils xz-utils liblzo2-2 cabextract iproute2 net-tools \
	netcat telnet libatomic1 libsdl1.2debian libsdl2-2.0-0 \
	libfontconfig icu-devtools libunwind8 libssl-dev sqlite3 \
	libsqlite3-dev libduktape205 locales ffmpeg gnupg2 \
	apt-transport-https software-properties-common ca-certificates \
	tzdata liblua5.3-0 libz-dev rapidjson-dev libglu1-mesa-dev \
	libgl1-mesa-dev libsdl1.2-dev build-essential \
	&& update-locale lang=en_US.UTF-8 \
	&& dpkg-reconfigure --frontend noninteractive locales \
	&& adduser --disabled-password --home /home/container container

USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh
CMD [ "/bin/bash", "/entrypoint.sh" ]
