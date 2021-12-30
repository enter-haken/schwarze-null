env=dev

.ONESHELL:

.PHONY: default
default: build

.PHONY: build
build:
	docker build -t schwarze_null_postgres_$(env) --file=Dockerfile_$(env) .

.PHONY: run
run: build
	docker run \
		--name schwarze_null_postgres_$(env) \
		-e POSTGRES_HOST_AUTH_METHOD=trust \
		-p 5432:5432 \
		-d schwarze_null_postgres_$(env) 

.PHONY: start
start:
	docker start schwarze_null_postgres_${env}

.PHONY: stop 
stop:
	docker stop schwarze_null_postgres_${env}

.PHONY: clean 
clean: 
	for container in $$(docker ps -a -f name=schwarze_null_postgres_${env} --format="{{.ID}}"); do \
		docker stop $$container || true; \
		docker rm $$container || true; \
	done

.PHONY: rmi
rmi:
	docker rmi schwarze_null_postgres_$(env) || true

.PHONY: all 
all: clean rmi build run

.PHONY: dump
dump:
	pg_dumpall14 -h localhost -U postgres -f /tmp/dump.sql

.PHONY: logs
logs:
	docker logs schwarze_null_postgres_$(env)

.PHONY: wait
wait:
	while [[ "accepting" != $$(docker exec -t schwarze_null_postgres_$(env) pg_isready -U postgres -d schwarze_null_$(env) | awk '{print $$3}') ]]; \
	do \
		echo "waiting for db..."; \
		sleep 1; \
	done

.PHONY: schema # only dev
schema:
	schema -u postgres -d schwarze_null_dev | dot -Tpng > ./assets/schema.png

.PHONY: watch 
watch:
	./watch.sh

.PHONY: loc
loc:
	for code in $$(find . -type f | grep -v assets); do cat $$code; done | grep "\S" | wc -l

