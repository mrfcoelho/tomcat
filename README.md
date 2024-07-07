# tomcat

A sample webapp deployed on tomcat

### Content

- Dockerfile to create the tomcat image
- Makefile to launch a container with the sample webapp deployed on tomcat
- src folder containing the certificates and server.xml customized to enable SSL

### How to use

- clone this repo
- cd into the directory where repo was cloned
- build the image

```
make build
```

- launch a container with the webapp

```
make run
```

- webapp will accessible locally at [https://localhost:4041/sample](https://localhost:4041/sample)
- stop the container and delete it

```
make clean
```
