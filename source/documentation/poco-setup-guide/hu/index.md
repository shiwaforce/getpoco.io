---
title: Pocósítás
---

# Pocósítás

Amikor poco-sítást kérünk, akkor arra gondolunk, hogy a poco nevű programmal ([link](https://getpoco.io/documentation/)) indítható legyen a forráskód. Például ne kelljen Node.js-t telepíteni a hostgépre, és ne kelljen hosszú docker compose parancsokat gépelni.

Elsőként a projekt gyökerében kell egy poco.yml nevű fájl. Erre egy példa itt van:

```yml
version: "3.0"
maintainer: "poco@sarkiroka.hu"

before_script:
  - cd docker/scripts && chmod +x *

environment:
  include: docker/conf/default/conf.env

plan:
  js:
    description: "local fejlesztést könnyítő dolgokat tartalmaz"
    docker-compose-file:
      - docker/dc-frontend.yml
      - docker/dc-proxy.yml
```

A version és a maintainer fix. A before_script részben azok a shell parancsok lehetnek, amik indítás előtt szükségesek lehetnek, hogy futtatásra kerüljenek.
environment-ben általában pont ezt szoktuk mindig tenni. Ezek olyan környezeti változók, amikkel a docker compose fájlokat lehet konfigurálni, nem pedig a konténerek belsejét. Tipikus példa portok megadása vagy a hostgépen lévő mappák megadása. Erre egy tipikus példa:

conf.env

```
PROJECT_HOME=../
```

És végül a poco.yml tartalmaz egy blokkot a plan-ekkel. Ez nem más, mint futtatási módok. Tipikus értékei: "local", "js", "build", "demo", "java", stb.

Minden plan tartalmaz egy szabadszöveges leírást emberek számára a description részben, valamint egy listát az adott plan-ben érintett docker-compose fájlokkal. Ebben a példában két ilyen van: egy proxy és egy frontend. A proxy-t azért használjuk, hogy ha több backend is van, akár több technológia, akkor megelőzzük a CORS problémákat, és egy közös domainen keresztül látszódjon az egész alkalmazás. Ide általában nginx-et használunk:

dc-proxy.yml

```
version: '3'

services:
  proxy:
    depends_on:
      - frontend
    links:
      - frontend
    image: nginx:alpine
    volumes:
      - ${PROJECT_HOME}/docker/conf/default/nginx.conf:/etc/nginx/nginx.conf:ro
    ports:
      - 80:80
    logging:
      options:
        max-size: "10k"
        max-file: "3"
```

Az nginx konfigot a docker/conf/default helyre szoktuk tenni. Ebben a példában így néz ki:

nginx.conf

```
events {
  worker_connections  4096;  ## Default: 1024
}

http {

	include	   mime.types;
	default_type  application/octet-stream;

	sendfile		on;
	keepalive_timeout  65;

	server {
		listen		80;
		server_name localhost;

		charset utf-8;

		# location /api {
        #     proxy_pass http://bff:3000;
        #     proxy_http_version 1.1;
        #     proxy_set_header Upgrade $http_upgrade;
        #     proxy_set_header Connection "upgrade";
        # }

		location / {
			proxy_pass http://frontend:3000;
			proxy_http_version 1.1;
			proxy_set_header    Host                localhost;
			proxy_set_header X-Real-IP $remote_addr;
			proxy_set_header X-Forwarded-Proto $scheme;
			proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
			proxy_set_header Upgrade $http_upgrade;
			proxy_set_header Connection "upgrade";
		}

	}
}
```

Azaz nincs saját kiszolgálás benne, csak proxy-ként használjuk valóban. Másik jó még ezzel, hogy nem kell a backendes kiszolgálók random portjait megjegyezni vagy kiengedni a host gépre, hanem minden a 80-as porton, simán localhost-on látszik majd. A különböző szervizek portjait nem is kell kiengedni, hiszen belül már elérhető, elegendő csak összelinkelni a dc-proxy fájlban, illetve megadni a függőségi sorrendet.

Nézzük a dc-frontend.yml fájlt ebben a példában:

```
version: '3'

services:
  frontend:
    image: node:22
    user: "${POCO_UID}:${POCO_GID}"
    restart: "no"  #String kell hogy legyen
    stop_signal: SIGKILL
    environment:
      UID: ${POCO_UID}
      GID: ${POCO_GID}
      HOST: ${HOST_SYSTEM}
    logging:
      options:
        max-size: "10k"
        max-file: "3"
    volumes:
      - ${PROJECT_HOME}/frontend:/usr/local/app/frontend
      - ${PROJECT_HOME}/docker:/usr/local/app/docker
    working_dir: /usr/local/app/frontend
    command: ../docker/scripts/start-dev.sh
```

Itt Node.js-t használunk, 22-es verziót. A user beállítás fontos lehet, az értékei a poco által biztosított ID-k. A stop_signal megadása azért fontos, hogy egy poco down js parancsnál ne timeout után állítsa le a konténert, hanem gyorsan. A konténerbe a környezeti változókat a szokásos módon lehet bejuttatni. A logolás beállítása is fontos, hogy ne árasszon el mindent a sok log.
Volume mapping esetén általában nem az egész projektet tesszük be, csak a szükséges részeket, de ügyelve, hogy megmaradjon a mappaszerkezet az /usr/local/app mappán belül. Végül pedig általában shell scripttel indítjuk az appot, azért, hogy legyen lehetőség szélesebb beavatkozásra.

start-dev.sh

```
#!/bin/bash

cat ../docker/conf/ai-art.txt

npm install --no-fund --no-audit --no-update-notifier

npm run dev
```

Ez simán elindítja a frontend dev szervert, illetve előtte feltelepíti a függőségeket, ha kell. Az ASCII art is fontos rész, azért van, hogy a logban elkülönüljön az új logsorok a régebbiektől.

Mindent összevetve a project a következő egységes paranccsal indítható ezután minden oprendszeren, minden előzetes nodej és egyéb telepítés vagy beállítás nélkül:

```
poco up js
```
