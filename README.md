# UJI Opendata Server - Docker container

## Instalación básica desde el repositorio

```
docker pull josegil/uji-opendata-server
```

## Creación y ejecución del contendor a partir del Dockfile

```
docker build --build-arg GITHUB_USERNAME={username} --build-arg GITHUB_PASSWORD={password -t josegil/uji-opendata-server .
```

```
docker run -d -p 8008:8008 josegil/uji-opendata-server
```

## Actualización del repositorio

```
docker login --username={username} --email={password}
docker push josegil/uji-opendata-server
```


