all: lint build test

build:
	docker compose build

clean:
	docker compose down -t 0

lint:
	docker run --rm -i hadolint/hadolint < Dockerfile

open:
	open http://localhost:8001

test:
	docker compose up -d --wait
