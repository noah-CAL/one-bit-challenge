DOCKER_NAME = one-bit-challenge
DOCKER_RUN = docker run \
						 --mount type=bind,source=.,target=/src \
						 -w /src \
						 -it $(DOCKER_NAME)

usage:
	@echo "usage: build_docker shell clean"

build_docker:
	docker build -t $(DOCKER_NAME) .
	
shell:
	$(DOCKER_RUN) bash

clean:
	rm $(EXE_NAME) *.dump *.o *.riscv $(EXE_NAME).*

.PHONY: build_docker shell clean
