APP=RTSPtoWeb
SERVER_FLAGS ?= -config config.json

build:
	@echo "build"
	go build -o $(APP) *.go

debug:
	@echo "debug"
	go build -gcflags "all=-N -l" -o $(APP)-debug *.go

run:
	@echo "run"
	go run *.go

serve:
	@$(MAKE) server

server:
	@echo "server $(SERVER_FLAGS)"
	./${APP} $(SERVER_FLAGS)

test:
	@echo "test"
	bash test.curl
	bash test_multi.curl

lint:
	@echo "lint"
	go vet

.NOTPARALLEL:

.PHONY: build run server test lint
