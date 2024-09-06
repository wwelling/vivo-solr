FROM solr:8.11

ARG CONFIGSET=vivocore
ENV CONFIGSET $CONFIGSET

USER root

COPY /vivocore/conf /opt/solr/server/solr/configsets/vivocore/conf

COPY setup.sh /setup.sh

COPY solr.xml /solr.xml

RUN \
chown -R solr:solr /opt/solr/server/solr/configsets/vivocore && \
chmod -R 755 /opt/solr/server/solr/configsets/vivocore

USER solr

CMD ["/bin/bash", "/setup.sh"]
