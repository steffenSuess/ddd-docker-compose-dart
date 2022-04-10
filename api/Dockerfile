FROM dart:stable AS build

WORKDIR /app
COPY pubspec.* ./
RUN dart pub get

COPY . .

RUN dart pub get --offline
RUN dart compile exe bin/api.dart -o bin/api

FROM scratch
COPY --from=build /runtime/ /
COPY --from=build /app/bin/api /app/bin/

EXPOSE 3000
CMD ["/app/bin/api"]
