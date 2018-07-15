# Overview

A single Makefile to build and run a signalsciences connected [httpbin](https://github.com/requests/httpbin) app on Heroku.

## Prerequisites

1. Log in to [Heroku](https://dashboard.heroku.com/)
2. Get your agent keys https://dashboard.signalsciences.net/corps/CORP/sites/SITE/agents

# Build

`make build SIGSCI_ACCESSKEYID=SIGSCI_ACCESSKEYID SIGSCI_SECRETACCESSKEY=SIGSCI_SECRETACCESSKEY DEV_TEST_NAME=sigsci-dev-test`

**Note:** If `DEV_TEST_NAME` is not specified a random 32 alphanumeric will be generated as the app name

# Run

`make run DEV_TEST_NAME=YOURAPPSNAME or 32 ALPHANUMERIC`

# Destroy

`make destroy DEV_TEST_NAME=YOURAPPSNAME or 32 ALPHANUMERIC`