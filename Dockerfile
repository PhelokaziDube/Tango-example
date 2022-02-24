FROM artefact.skao.int/ska-tango-images-pytango-builder:9.3.16 as buildenv
FROM artefact.skao.int/ska-tango-images-pytango-runtime:9.3.14

RUN ipython profile create

RUN pip install ska-tango-base ska-log-transactions --extra-index-url https://artefact.skao.int/#browse/browse:pypi-internal

