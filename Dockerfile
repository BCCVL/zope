FROM hub.bccvl.org.au/centos/centos7-epel:2016-02-04


RUN yum -y install http://yum.postgresql.org/9.5/redhat/rhel-7-x86_64/pgdg-centos95-9.5-2.noarch.rpm && \
    yum install -y gcc python-devel gettext mailcap && \
    yum install -y postgresql95-devel && \
    yum clean all

ENV SETUPTOOLS 19.6.1
ENV ZCBUILDOUT 2.5.0
ENV Z_HOME /opt/zope
ENV Z_VAR /var/opt/zope
ENV Z_CONF /etc/opt/zope
ENV PATH /usr/pgsql-9.5/bin:$PATH

RUN groupadd -g 414 zope && \
    useradd -u 414 -g 414 -d $Z_HOME -m -s /bin/bash zope

COPY files/versions.cfg \
     files/base.cfg \
     files/bootstrap-buildout.py \
     files/build.sh \
     $Z_HOME/

WORKDIR $Z_HOME

RUN $Z_HOME/build.sh

EXPOSE 8080

CMD ./bin/instance console
