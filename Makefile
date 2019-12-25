.PHONY: db db-build db-migrate

CONTAINER_CLI ?= sudo podman

DB_HOST_DIR ?= ${PWD}/container-data/postgres
DB_GUEST_DIR ?= /var/lib/postgresql/data
DB_TAG ?= noahhuppert/post-gis-route:latest
DB_USER ?= dev-mega-route
DB_PASSWORD ?= dev-mega-route
DB_DB ?= dev-mega-route

# runs dev postgres server
db:
	mkdir -p ${DB_HOST_DIR}
	${CONTAINER_CLI} run \
		-it \
		--rm \
		--net host \
		-e POSTGRES_USER=${DB_USER} \
		-e POSTGRES_PASSWORD=${DB_PASSWORD} \
		-e PGDATA=${DB_GUEST_DIR} \
		-e POSTGRES_DB=${DB_DB} \
		-v ${DB_HOST_DIR}:${DB_GUEST_DIR} \
		${DB_TAG}

# builds database container
db-build:
	${CONTAINER_CLI} build -t ${DB_TAG} -f db.dockerfile .

# runs migrations on database
db-migrate:
	${CONTAINER_CLI} run \
		-it \
		--rm \
		--net host \
		-v ${PWD}:/mnt \
		${DB_TAG} \
		psql \
			-U ${DB_USER} \
			-w ${DB_PASSWORD} \
			-h localhost \
			-d ${DB_DB} \
			-f /mnt/schema.sql
