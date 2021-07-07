FROM nexus.engageska-portugal.pt/ska-tango-images/pytango-builder:9.3.3.3 as buildenv
FROM nexus.engageska-portugal.pt/ska-tango-images/pytango-runtime:9.3.3.3


RUN ipython profile create

RUN pip install ska-tango-base ska-log-transactions --extra-index-url https://nexus.engageska-portugal.pt/repository/pypi/simple

