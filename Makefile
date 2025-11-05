WP_DATA = /home/smorin/data/wordpress
DB_DATA = /home/smorin/data/mariadb

all: up

up: build
	@mkdir -p $(WP_DATA)
	@mkdir -p $(DB_DATA)
	docker-compose -f ./docker-compose.yml up -d

down:
	docker-compose -f ./docker-compose.yml down

stop:
	docker-compose -f ./docker-compose.yml stop

start:
	docker-compose -f ./docker-compose.yml start

build:
	docker-compose -f ./docker-compose.yml build

clean:
	@echo "🧹 Stopping and removing containers..."
	@docker stop $$(docker ps -qa) 2>/dev/null || true
	@docker rm $$(docker ps -qa) 2>/dev/null || true
	@echo "🧩 Removing images, volumes and networks..."
	@docker rmi -f $$(docker images -qa) 2>/dev/null || true
	@docker volume rm $$(docker volume ls -q) 2>/dev/null || true
	@docker network rm $$(docker network ls -q | grep -vE "bridge|host|none") 2>/dev/null || true
	@echo "🗑️  Cleaning local data directories..."

re: clean up

prune: clean
	@docker system prune -a --volumes -f
