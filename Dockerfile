# Build step container
FROM python:3.11.9-alpine AS build
WORKDIR /work
COPY . /work/
RUN apk update && \
    apk add --virtual build-deps gcc python3-dev musl-dev && \
    apk --no-cache add -Uu \
    make curl binutils build-base mariadb-dev && \
    pip install pyinstaller && \
    pip install --upgrade pip && \
    pip install -r ./requirments.txt && \
    make build


# Main application container
FROM python:3.11.9-alpine
COPY --from=build /work/dist/run /bin/app
EXPOSE 80
CMD ["/bin/app"]
