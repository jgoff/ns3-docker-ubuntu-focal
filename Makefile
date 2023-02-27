NAME ?= ns3
NS3_DOCKER_TAG ?= 3.37
ME ?= $(shell whoami)

all: build start

.PHONY: build start
build:
  docker build \
    --tag="$(ME)/ns3:$(NS3_DOCKER_TAG)" \
    .

start:
  docker run -ti --privileged --network=host -p 5060:5060 --name $(NAME) $(ME)/ns3:$(NS3_DOCKER_TAG)
