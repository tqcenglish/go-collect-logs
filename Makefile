buildDateTime = $(shell date '+%Y-%m-%d %H:%M:%S')
gitCommitCode = $(shell git rev-list --full-history --all --abbrev-commit --max-count 1)
goVersion = $(shell go version)

run:
	go build

release:
	GOOS=linux GOARCH=amd64 go build -tags ""  -ldflags "-X 'main.buildDateTime=$(buildDateTime)' -X 'main.gitCommitCode=$(gitCommitCode)' -X 'main.goVersion=${goVersion}' -s -w" 
	upx -9 ./go-collect-logs
all: release
