FROM ghcr.io/pterodactyl/installers:debian
RUN apt update && apt install -y --no-install-recommends git libglu1-mesa-dev libgl1-mesa-dev libsdl1.2-dev build-essential
