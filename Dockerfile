# Stage 1 - Install dependencies and build the app
FROM debian:latest AS build-env

# Install flutter dependencies
RUN apt-get update && apt-get install -y \
    curl git wget unzip gdb libstdc++6 libglu1-mesa \
    fonts-droid-fallback lib32stdc++6 python3 \
    && apt-get clean

# Clone the flutter repo (shallow clone for speed)
# 버전은 .fvmrc 의 로컬 버전과 맞춘다
RUN git clone --depth 1 --branch 3.44.8 \
    https://github.com/flutter/flutter.git /usr/local/flutter

WORKDIR /usr/local/flutter

# Set flutter path
ENV PATH="/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:${PATH}"

# Run flutter setup
RUN flutter doctor -v
RUN flutter config --enable-web

# Copy files to container and build
RUN mkdir /app/
COPY . /app/
WORKDIR /app/
# --no-web-resources-cdn: 엔진 산출물을 gstatic CDN 대신 같은 출처에서 받는다
# (COEP 를 켜기 위해 필요하고, 서드파티 의존도 사라진다)
RUN flutter build web --release --wasm --no-web-resources-cdn

# Stage 2 - Create the run-time image
FROM nginx:1.21.1-alpine
COPY --from=build-env /app/build/web /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
