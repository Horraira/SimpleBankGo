postgres:
	docker run --name postgres12 -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=root -e POSTGRES_PASSWORD=secret -d postgres:12-alpine

createdb:
	docker exec -it pg17  createdb --username=postgres --owner=postgres simple_bank

dropdb:
	docker exec -it pg17 dropdb --username=postgres simple_bank

migrateup:
	migrate -path db/migration -database "postgresql://postgres:postgres@localhost:5432/simple_bank?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migration -database "postgresql://postgres:postgres@localhost:5432/simple_bank?sslmode=disable" -verbose down

test:
	go test -v -cover ./...

server:
	go run main.go

.PHONY: postgres createdb dropdb  migrateup migratedown test server


# cd /mnt/c/Users/User/Projects/simplebank