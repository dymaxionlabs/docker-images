PREFIX ?= /usr/local
TAG_NAME := dymaxionlabs/sen2cor
VERSION = 2.5.5

install:
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	install -m 0755 bin/sen2cor $(DESTDIR)$(PREFIX)/bin/sen2cor

uninstall:
	@$(RM) $(DESTDIR)$(PREFIX)/bin/ruby-cli-app
	@docker rmi atomicobject/ruby-cli-app:$(VERSION)

build:
	@docker build -t $(TAG_NAME):$(VERSION) .


.PHONY: install uninstall build
