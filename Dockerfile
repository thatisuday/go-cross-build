# Debian GNU/Linux 11 (1.17-bullseye)
FROM golang:1.17-bullseye

# copy entrypoint file
COPY entrypoint.go /usr/bin/entrypoint.go

# change mode of the entrypoint file
RUN chmod +x /usr/bin/entrypoint.go

# set entrypoint command
ENTRYPOINT [ "go", "run", "/usr/bin/entrypoint.go" ]
