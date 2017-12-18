NAME=hello-world

build:
	docker-compose build
.PHONY: docker-build

up:
	docker-compose up
.PHONY: up

ci-build:
	docker-compose -f docker/test/docker-compose.yml -p $(NAME)_ci build
.PHONY: docker-test-build
