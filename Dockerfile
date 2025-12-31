# Stage 1 - Install dependencies and build the app
FROM debian:latest AS build-env

# Install flutter dependencies
RUN apt-get update && apt-get install -y \
    curl git wget unzip gdb libstdc++6 libglu1-mesa \
    fonts-droid-fallback lib32stdc++6 python3 \
    && apt-get clean

# Clone the flutter repo (shallow clone for speed)
RUN git clone https://github.com/flutter/flutter.git /usr/local/flutter

WORKDIR /usr/local/flutter

# Checkout specific Flutter version (3.35.4)
RUN git fetch --tags \
    && git checkout 3.38.5

# Set flutter path
ENV PATH="/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:${PATH}"

# Run flutter setup
RUN flutter doctor -v
RUN flutter config --enable-web

# Copy files to container and build
RUN mkdir /app/
COPY . /app/
WORKDIR /app/
RUN flutter build web

# Stage 2 - Create the run-time image
FROM nginx:1.21.1-alpine
COPY --from=build-env /app/build/web /usr/share/nginx/html
