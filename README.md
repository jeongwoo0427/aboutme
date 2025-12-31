# aboutme

flutter : 3.38.5

# Launch Prompt

- Local
fvm flutter run -d chrome 

- Server
fvm flutter run -d web-server --web-hostname 0.0.0.0 --web-port 8080


# Build Prompt

fvm flutter build web --release

이후 바로 NGINX 배포하기

sudo systemctl restart nginx
