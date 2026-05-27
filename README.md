# Zadanie 2 - Mikołaj Nadra TI 6.2

Ze względu na 3 błędy typu HIGH w curl, zbudowany obraz nie jest przesyłany do rejestru ghcr.io.

Cache aplikacji zapisywany jest na Dockerhub pod [tym linkiem](https://hub.docker.com/repository/docker/minad1822/main/tags/weather_app_cache/sha256:670f8b69bb53f751206cebd6fd10ed43dba4a500db063d729b170ee51e1d4bf0).

Tagowanie obrazów odbywa się za pomocą [semver](https://semver.org/lang/pl/).

### Opis etapów workflow

Po zalogowaniu do DockerHub i rejestru GHCR, budowany jest jeden obraz, który zapisywany jest lokalnie, do analizy. 

W momencie, gdy przeskanowany obraz zawiera podatności typu CRITICAL lub HIGH, łańcuch jest przerywany, a akcja wypychająca obrazy do rejestru nie jest wykonywana
