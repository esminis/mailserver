FROM ubuntu:14.04

MAINTAINER Tautvydas Andrikys <esminis@esminis.lt>

RUN apt-get update
RUN apt-get install -y debconf-utils openssl libssl-dev rsyslog make gcc wget

# Postfix and sasl2
RUN echo "postfix postfix/main_mailer_type string 'Internet Site'" | debconf-set-selections
RUN echo "postfix postfix/mailname string localhost" | debconf-set-selections
RUN echo "postfix postfix/root_address string admin@localhost" | debconf-set-selections
RUN echo "postfix postfix/mynetworks string 0.0.0.0/0" | debconf-set-selections
RUN apt-get install -y postfix sasl2-bin procmail mailutils libcrack2 libcrack2-dev

ADD postfix /etc/postfix

RUN rm -rf /etc/sasldb2
RUN echo "password" | saslpasswd2 -f /var/spool/postfix/etc/sasldb2 -c -u domain.does.not.exist.com user
RUN ln -s /var/spool/postfix/etc/sasldb2 /etc/sasldb2

RUN wget ftp://sunsite.unc.edu/pub/Linux/system/mail/pop/vm-pop3d-1.1.6.tar.gz
RUN tar xzvf vm-pop3d-1.1.6.tar.gz
RUN cd vm-pop3d-1.1.6 ; ./configure --enable-virtual --prefix=/usr ; make install
RUN rm -rf vm-pop3d-1.1.6
RUN rm -rf vm-pop3d-1.1.6.tar.gz

RUN wget http://www.loomsday.co.nz/tequila/tequila-2.2.16.tar.gz
RUN tar xzvf tequila-2.2.16.tar.gz
ADD tequila/bin/install /tequila-2.2.16/bin/install
RUN cd /tequila-2.2.16 ; ./install
RUN rm -rf tequila-2.2.16
RUN rm -rf tequila-2.2.16.tar.gz
RUN mkdir /opt/tequila/domains/postfix
RUN mkdir /opt/tequila/domains/vm_pop
RUN ln -s /opt/tequila/domains/vm_pop /etc/virtual
RUN ln -s /var/spool/mail /var/spool/virtual

ADD tequila/tequila.conf /opt/tequila/etc/tequila.conf

RUN chmod -R 0777 /opt/tequila/domains
RUN chmod -R 0777 /var/spool/mail
RUN chmod -R 0777 /var/spool/postfix/etc/sasldb2

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 25 465 110 995 8443

# @todo add crontab: 0 0 * * * /opt/tequila/bin/cronjob_vacation
# @todo pop3 ssl support
# @todo permissions
# @todo test receiving mail to smtp server from web
# @todo Readme: access @ https://[ip]:8443, user: admin, pass: admin