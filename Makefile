IMAGE_NAME := waja/calcardbackup

build:
	docker build --rm -t $(IMAGE_NAME) .
	
run:
	@echo docker run --rm -it $(IMAGE_NAME) 
	
shell:
	docker run --rm -it --entrypoint sh $(IMAGE_NAME) -l

test: build
	@if ! [ "$$(docker run --rm -it $(IMAGE_NAME) /opt/calcardbackup/calcardbackup -h | grep 'START calcardbackup' | sed 's/.* START //' | sed 's/ ver\..*//')" = "calcardbackup" ]; then exit 1; fi
