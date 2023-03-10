.DEFAULT_GOAL := all
MAKEFLAGS=--warn-undefined-variables
SHELL := bash

SUDO ?= $(shell if ! groups | grep -q docker; then echo 'sudo --preserve-env=DOCKER_BUILDKIT,JEKYLL_GITHUB_TOKEN'; fi)

.PHONY: primer
primer:
	wget https://cdnjs.cloudflare.com/ajax/libs/Primer/14.3.0/primer.min.css -O _sass/_build.scss

.ONESHELL: submodules
.PHONY: submodules
submodules:
	cd _useful-links
	git pull

_posts/2019-12-18-useful-links.md: _posts/_2019-12-18-useful-links.md _useful-links/README.md
	cat _posts/_2019-12-18-useful-links.md >$@
	tail _useful-links/README.md -n +5 >>$@

.PHONY: update
update: submodules _posts/2019-12-18-useful-links.md primer

.PHONY: build
build: _posts/2019-12-18-useful-links.md
	bundle exec jekyll build

.PHONY: clean
clean:
	rm -rf _site/

.PHONY: all
all: build

Gemfile.lock: Gemfile
		bundler lock

gemset.nix: Gemfile Gemfile.lock
		bundix
