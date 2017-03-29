all: build

build:
	@docker build --tag=ziis/namecoind .
