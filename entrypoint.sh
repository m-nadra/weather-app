#!/bin/sh
echo "Autor: Mikołaj Nadra"
echo "Kontener uruchomiony: $(date)"
echo "Aplikacja uruchomiona na porcie 3000"
exec nginx -g 'daemon off;'