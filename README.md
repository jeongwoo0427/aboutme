# aboutme

flutter : 3.44.8

# Launch Prompt

- Local
fvm flutter run -d chrome 

- Server
fvm flutter run -d web-server --web-hostname 0.0.0.0 --web-port 8080


# Build Prompt

fvm flutter build web --release --wasm

--wasm 은 dart2wasm(skwasm) 과 dart2js(canvaskit) 을 모두 빌드한다.
WasmGC 를 지원하는 브라우저는 main.dart.wasm 을, 아니면 main.dart.js 를 받는다.
(둘 다 배포해야 하므로 build/web 전체를 그대로 올린다)

이후 바로 NGINX 배포하기

sudo systemctl restart nginx
