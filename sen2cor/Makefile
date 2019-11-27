PREFIX ?= /usr/local
TAG_NAME := dymaxionlabs/sen2cor
VERSION = 2.8.0

.PHONY: install uninstall build push

install:
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	install -m 0755 bin/sen2cor $(DESTDIR)$(PREFIX)/bin/sen2cor

uninstall:
	@$(RM) $(DESTDIR)$(PREFIX)/bin/sen2cor
	@docker rmi $(TAG_NAME)

build:
	@docker build -t $(TAG_NAME) .
	@docker tag $(TAG_NAME) $(TAG_NAME):$(VERSION)

push: build
	@docker push $(TAG_NAME)
