image_name = apache-tomcat:8.5.100
app_name = sampleWebApp

build:
	docker build -t $(image_name) .

run: build
	docker run --name $(app_name) -p 4041:443 $(image_name)

clean:
	docker rm -f $(app_name)