.PHONY: help

help:
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

DOCKER_COMPOSE := docker-compose
DOCKER_COMPOSE_FILE := local_env/docker-compose.yml

build: ## build container
	@$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) build

up: ## start all container in foreground
	@$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) up

start: ## start all container in background
	@$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) up -d

setup: ## build and start all container in background
	@$(MAKE) build
	@$(MAKE) start

stop: ## stop all container
	@$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) stop

restart: ## restart all container
	$(MAKE) stop
	$(MAKE) start

ps:
	@$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) ps

logs: ## Show logs for all container
	@$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) logs --tail=100 -f 

clean: ## Clean all data
	@$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) down -v