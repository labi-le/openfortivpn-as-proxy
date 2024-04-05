up:
	docker compose up -d --remove-orphans

logs:
	docker compose logs -f

down:
	docker compose down

edit:
	nvim docker-compose.yaml

ps:
	docker compose ps
