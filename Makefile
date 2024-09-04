dc_up:
	docker compose up -d

dc_down:
	docker compose down

.PHONY: dc_up dc_down