#
# Hugo Bookshelf Example
#

hugo:
	hugo

help:
	@echo "dev          Starts up a Hugo dev instance of the site for local development"
	@echo "prod         Starts up a Hugo production instance of the site for local testing"
	@echo "test         Uses HTTPie to contact the dev and test server"
	@echo "theme-list   List all Hugo things installed"
	@echo
	@echo "This site was written for use with Hugo Static Site Generator v0.16"


dev:
	@term-wipe
	@# hugo server --buildDrafts --watch --ignoreCache --theme=purehugo --verbose
	hugo server --buildDrafts --verbose


prod:
	hugo server --baseURL 'megaworld.test' --port 1080 --appendPort false --disableLiveReload


test:
	http 'http://localhost:1313/'
	@echo
	http 'http://megaworld.test/'


theme-list:
	@ls -l ./themes