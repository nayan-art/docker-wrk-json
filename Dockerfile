FROM registry.access.redhat.com/ubi8/ubi:8.1
USER root
RUN  yum -y groupinstall 'Development Tools'
RUN  yum -y install openssl-devel git
RUN git clone https://github.com/wg/wrk.git
RUN cd wrk && make  && make WITH_LUAJIT=/usr WITH_OPENSSL=/usr
RUN cp wrk /usr/local/bin/
WORKDIR /
