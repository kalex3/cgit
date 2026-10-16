# cgit

Lightweight docker image for `cgit`, running `lighttpd` web server on top of `alpine` base image.

## Usage

### 1. Build the image

```sh
git clone https://github.com/kalex3/cgit
cd cgit
docker build -t cgit:latest .
```

### 2. Run the container

```sh
docker run -d --name cgit -p 8080:80 \
               -v $(pwd)/git:/srv/git \
               -v $(pwd)/README.md:/usr/share/webapps/cgit/about.md \
               cgit:latest
```

### 3. Put your ***bare*** repositories in `./git`

```sh
git init --bare git/example.git
echo "example description" > git/example.git/description
git clone git/example.git example-worktree
cd example-worktree # now you can commit, push, etc. as usual
```

## Compose example (pre-built image)

```yml
services:
  cgit:
    image: ghcr.io/kalex3/cgit:latest
    container_name: cgit
    restart: unless-stopped
    ports:
      - 8080:80
    volumes:
      - ./git:/srv/git:ro
      - ./README.md:/usr/share/webapps/cgit/about.md:ro
```
