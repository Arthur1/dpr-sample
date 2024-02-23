.PHONY: build
build:
	CGO_ENABLED=0 GOOS=linux GOARCH=arm64 go build -o ./bootstrap
	zip lambda.zip bootstrap
	$(RM) bootstrap
