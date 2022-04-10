# ddd-docker-compose-dart
This repo is based on the Docker Compose tutorial from The [Native Web GmbH](https://www.thenativeweb.io) and follows [this](https://www.youtube.com/watch?v=0jC5B9iTF_g) video course. However, it was implemented entirely using the [Dart programming language](https://dart.dev) instead of [Node.js](https://nodejs.org/en/) used in the video. It consists of a Dart Server and a Dart Web Frontend.

## Backend
The Dart Server uses the following packages:
- [shelf](https://pub.dev/packages/shelf)
- [shelf_router](https://pub.dev/packages/shelf_router)

### Local
To run this server locally, run as follows:
```bash
cd api
```
```bash
pub get
```
```bash
dart run bin/api.dart
```
or using docker:
```bash
cd api
```
```bash
docker build -t dart-server .
```
```bash
docker run -it --rm -p 3000:3000 --name myserver dart-server
```

### Try it out
```bash
curl http://localhost:3000
```

## Frontend
The Dart Frontend uses the following packages:
- [http](https://pub.dev/packages/http)

And is hosted using [nginx](https://hub.docker.com/_/nginx).

### Local
To run this server locally, run as follows:
```bash
cd ui
```
```bash
pub get
```
Setup [webdev](https://dart.dev/tools/webdev)
```bash
webdev serve
```
or using docker:
```bash
cd ui
```
```bash
docker build -t dart-ui .
```
```bash
docker run -name dart-ui-nginx -d -p 4000:80 dart-ui
```

### Try it out
Open Chrome Browser and navigate to 
http://localhost:4000. [Webdev serve](https://dart.dev/tools/webdev) in debug mode only supports Chrome Browser.

## Docker-Compose
Start both services together, use:
```bash
docker-compose up -d
```

