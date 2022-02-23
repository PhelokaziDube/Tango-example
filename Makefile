
SHELL=/bin/bash
.SHELLFLAGS=-o pipefail -c

NAME=ska-dish-lmc

VERSION=1.0.0
IMAGE=$(CAR_OCI_REGISTRY_HOST)/$(NAME)
DOCKER_BUILD_CONTEXT=.
DOCKER_FILE_PATH=Dockerfile

MINIKUBE ?= true ## Minikube or not
TANGO_HOST ?= tango-databaseds:10000  ## TANGO_HOST connection to the Tango DS

# Set the specific environment variables required for pytest
PYTHON_VARS_BEFORE_PYTEST ?= PYTHONPATH=.:./src \
							 TANGO_HOST=$(TANGO_HOST)


# include makefile targets from the submodule
-include .make/k8s.mk
-include .make/helm.mk

# include your own private variables for custom deployment configuration
-include PrivateRules.mak

K8S_CHART_PARAMS = --set global.minikube=$(MINIKUBE) \
	--set global.tango_host=$(TANGO_HOST)
