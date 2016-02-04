FROM hub.bccvl.org.au/centos/centos7-epel:2016-02-04


RUN yum install -y gcc python-devel && \
    yum clean all

ENV SETUPTOOLS 19.6.1
ENV ZCBUILDOUT 2.5.0
ENV ZOPE_HOME /opt/zope
ENV ZOPE_VAR /var/opt/zope
ENV ZOPE_CONF /etc/opt/zope

RUN groupadd -g 414 zope && \
    useradd -u 414 -g 414 -d $ZOPE_HOME -m -s /bin/bash zope

COPY files/versions.cfg \
     files/base.cfg \
     files/bootstrap-buildout.py \
     files/build.sh \
     $ZOPE_HOME/

WORKDIR $ZOPE_HOME

RUN $ZOPE_HOME/build.sh

EXPOSE 8080

CMD ./bin/instance console
