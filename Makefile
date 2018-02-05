all: package

FLAGS =
ENVVAR = GOOS=linux GOARCH=amd64 CGO_ENABLED=0
REGISTRY = pub.domeos.org/domeos
TAG = 1.12.6

deps:
	go get github.com/tools/godep

package: clean deps
	$(ENVVAR) go build -o imagebuilder

test-unit: clean deps package
	$(ENVVAR) go test --race . $(FLAGS)

container: package
	docker build -t ${REGISTRY}/build:$(TAG) .

push: container
	docker push ${REGISTRY}/build:$(TAG)

clean:
	rm -f imagebuilder

.PHONY: all deps build test-unit container push clean
