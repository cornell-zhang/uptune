.PHONY: all build-python build-src

all: build-src 

build-src: build-python
	$(MAKE) -C src

build-python:
	pip install -e .; 

clean:
	rm -rf build
	$(MAKE) clean -C src
