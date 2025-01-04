FROM rockylinux:9-minimal
RUN microdnf -y install wget && \
wget https://opensource.vsphone.com.br/teams/teams.repo -O /etc/yum.repos.d/teams.repo && \
microdnf -y install asterisk-pjsip sngrep asterisk-hep && \
rm -Rf /var/cache/yum/ && \
rm -Rf /usr/share/doc/asterisk && \
rm -Rf /var/lib/rpm && \
rm -Rf /var/lib/dnf && \
rm -Rf /usr/lib64/python3.9
COPY arquivos/ /etc/asterisk/
COPY sngreprc /root/.sngreprc
WORKDIR /etc/asterisk
CMD /etc/asterisk/service.sh
