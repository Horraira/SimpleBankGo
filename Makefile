SQLC_PATH := $(shell pwd | sed 's|^/c|C:|')

postgres:
	docker run --name postgres12 -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=root -e POSTGRES_PASSWORD=secret -d postgres:12-alpine

createdb:
	docker exec -it postgres12  createdb --username=root --owner=root simple_bank

dropdb:
	docker exec -it postgres12  dropdb --if-exists simple_bank

migrateup:
	migrate -path db/migration -database "postgresql://root:secret@localhost:5432/simple_bank?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migration -database "postgresql://root:secret@localhost:5432/simple_bank?sslmode=disable" -verbose down

.PHONY: postgres createdb dropdb  migrateup migratedown


# cd /mnt/c/Users/User/Projects/simplebank