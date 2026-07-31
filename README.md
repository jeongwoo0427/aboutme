# aboutme

flutter : 3.44.8

# Launch Prompt

- Local
fvm flutter run -d chrome 

- Server
fvm flutter run -d web-server --web-hostname 0.0.0.0 --web-port 8080


# Deploy

구조: 호스트 nginx(리버스 프록시) -> 컨테이너 :7000 -> 컨테이너 내부 nginx :80

    docker compose up -d --build

--build 없으면 기존 이미지를 재사용해서 변경사항이 반영되지 않는다.
첫 배포나 문제 확인 시에는 -d 를 빼고 로그를 보는 편이 낫다.

호스트 nginx 는 건드릴 필요 없다.
.wasm MIME 과 gzip 은 모두 컨테이너 안 nginx.conf 가 처리하고,
프록시는 Content-Type / Content-Encoding 을 그대로 통과시킨다.

배포 후 압축이 실제로 걸렸는지 한 번 확인할 것:

    curl -sI -H "Accept-Encoding: gzip" https://도메인/main.dart.wasm

  -> Content-Type: application/wasm / Content-Encoding: gzip 이 나와야 한다.
     Content-Encoding 이 없으면 호스트 nginx 에
     proxy_set_header Accept-Encoding ""; 가 있는지 확인할 것.
     (이게 있으면 컨테이너가 압축을 못 한다)


# Build (로컬 확인용)

fvm flutter build web --release --wasm --no-web-resources-cdn

--wasm 은 dart2wasm(skwasm) 과 dart2js(canvaskit) 을 모두 빌드한다.
WasmGC 를 지원하는 브라우저는 main.dart.wasm 을, 아니면 main.dart.js 를 받는다.
(둘 다 필요하므로 build/web 전체를 그대로 서빙한다)

--no-web-resources-cdn 은 엔진 산출물(skwasm.wasm 등)을 gstatic CDN 대신
같은 출처에서 받게 한다. 서드파티 의존이 사라지고, gzip 대상이 된다.
CDN 으로 되돌리려면 이 플래그만 빼면 된다.

Dockerfile 도 같은 플래그로 빌드하므로 둘을 함께 바꿀 것.
