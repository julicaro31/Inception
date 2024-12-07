build:
	docker-compose -f docker/docker-compose.yml build

up:
	docker-compose -f docker/docker-compose.yml up -d

down:
	docker-compose -f docker/docker-compose.yml down

clean:
	docker-compose -f docker/docker-compose.yml down -v --rmi all
	rm -rf docker/volumes/wordpress/*
	rm -rf docker/volumes/db/*
