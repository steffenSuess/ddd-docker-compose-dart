FROM dart:stable AS build

WORKDIR /app
COPY pubspec.* ./
RUN mkdir /pub-cache

ENV PUB_CACHE=/pub-cache \
    PATH="${PATH}:/pub-cache/bin"
RUN pub global activate webdev
RUN dart pub get

COPY . .
RUN dart pub get --offline
RUN webdev build

EXPOSE 4000

FROM nginx:1.21.6-alpine
COPY --from=build /app/build /usr/share/nginx/html
# COPY --from=build /runtime/ /