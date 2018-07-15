DEV_TEST_NAME = $(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)

build:
	rm -rf httpbin/
	git clone https://github.com/requests/httpbin.git
	heroku create --app $(DEV_TEST_NAME) --buildpack git://github.com/heroku/heroku-buildpack-python.git
	heroku buildpacks:add --index 1 https://dl.signalsciences.net/sigsci-heroku-buildpack/sigsci-heroku-buildpack_latest.tgz -a sigsci-dev-test
	sed -i -e 's/web\: /web\: sigsci\/bin\/sigsci-start /g' httpbin/Procfile && rm httpbin/Procfile-e
	heroku config:set SIGSCI_ACCESSKEYID=$(SIGSCI_ACCESSKEYID) -a $(DEV_TEST_NAME)
	heroku config:set SIGSCI_SECRETACCESSKEY=$(SIGSCI_SECRETACCESSKEY) -a $(DEV_TEST_NAME)
	cd httpbin/; git add .; git commit -m "new deploy"
run:
	cd httpbin/; heroku git:remote -a $(DEV_TEST_NAME); git push heroku master
destroy:
	heroku apps:destroy --app $(DEV_TEST_NAME) --confirm $(DEV_TEST_NAME)