# Mikołaj Nadra TI 6.2 - Zadanie 1

Opis części obowiązkowej

![2](screeny/2.png)

### Zbudowanie obrazu

```bash
docker build -t minad1822/main:weather-app .
```

### Uruchomienie konteneru

```bash
docker run -it --name weather-container -p 3000:3000 minad1822/main:weather-app
```

![1](screeny/1.png)

### Sprawdzanie logów
```bash
docker logs weather-container
```

![5](screeny/5.png)

### Liczba warstw - 6
```bash
docker inspect
```

![3](screeny/3.png)

### Rozmiar obrazu - 15.5 MB 
```bash
docker images
```

![4](screeny/4.png)