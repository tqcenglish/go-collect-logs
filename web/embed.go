package web

import "embed"

//go:embed build/*
var WebFiles embed.FS
