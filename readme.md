Mail Server by [esminis](http://esminis.com)
============================================

This is simple docker mail server, it includes:

* [Postfix](http://www.postfix.org/) for SMTP
* [Virtualmail-pop3d (aka vm-pop3d)](http://www.reedmedia.net/software/virtualmail-pop3d/) for POP3
* [Tequila](http://www.loomsday.co.nz/development?id=tequila) for web administration interface

Quickstart
----------

Of course first download and install [Docker](https://docker.com/), then just run:

    docker run esminis/mail-server-postfix-vm-pop3d

Run modes
---------
* Run 

        docker run esminis/mail-server-postfix-vm-pop3d

* Run as daemon

        docker run -d esminis/mail-server-postfix-vm-pop3d

* Run as daemon exposing ports

        docker run -it -p 8443:8443 -p 25:25 -p 465:465 -p 995:995 esminis/mail-server-postfix-vm-pop3d

* Run and get into console

        docker run -it esminis/mail-server-postfix-vm-pop3d /bin/bash

Ports
-----

* 25 - SMTP, only for receiving email
* 110 - POP3, use if you want but POP3 SSL is recommended
* 465 - SMTP SSL, for sending email, uses snakeoil certificate
* 995 - POP3 SSL, uses snakeoil certificate
* 8443 - Tequila SSL, web interface to control mail users

Tequila
-------

Access web administration interface Tequila on [https://[ip]:8443](https://[ip]:8443)
Administrator user: admin
Administrator user password: x

Source
------

You can find source for building with Dockerfile here: [https://bitbucket.org/esminis/mailserver](https://bitbucket.org/esminis/mailserver)

Building
--------

* Get build source from [https://bitbucket.org/esminis/mailserver](https://bitbucket.org/esminis/mailserver)
* Go inside directory
* Build

        docker build .