#
# Hugo Bookshelf Example
#

help:
	@echo "build        Built out the static site in the /public/ directory"
	@echo "clean        Delete the public directory and Caddy search cache"
	@echo "dev          Starts up a Hugo dev instance of the site for local development"
	@echo "prod         Starts up a Hugo production instance of the site for local testing"
	@echo "publish      Build site and push files to the production server"
	@echo "test         Uses HTTPie to contact the dev and test server"
	@echo "theme-list   List all Hugo things installed"
	@echo
	@echo "This site was written for use with Hugo Static Site Generator v0.16"


build:
	@term-wipe
	hugo


clean:
	@term-wipe
	rm -rf public
	rm -rf /tmp/caddyIndex


dev:
	@term-wipe
	@# hugo server --buildDrafts --watch --ignoreCache --theme=purehugo --verbose
	hugo server --buildDrafts --verbose


publish:
	@term-wipe
	hugo
	find public -name .DS_Store -delete
	scp -r public/* root@megaworld.online:/vhost/online/megaworld/www/web


prod:
	hugo server --baseURL 'megaworld.test' --port 1080 --appendPort false --disableLiveReload


test:
	http 'http://localhost:1313/'
	@echo
	http 'http://megaworld.test/'


theme-list:
	@ls -l ./themes