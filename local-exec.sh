#! /bin/sh
echo "---\nRetrieving local exec image"
docker pull gitlab.faas.it:5050/faas-helpers/local-faas-exec:latest
echo "---\nStopping and removing previous local exec container"
docker stop local-faas-exec
echo "---\nStarting new local exec"
docker run -d --rm -e API_PORT=:8080 -e LOG_WRITE_MODE=console -e CURRENT_FAAS_PATH=$(pwd) -v /var/run/docker.sock:/var/run/docker.sock -p 8080:8080 --name local-faas-exec gitlab.faas.it:5050/faas-helpers/local-faas-exec:latest
docker build --build-arg image=python:3.9 -t myfaas .
open http://localhost:8080/api/exec/myfaas/latest

