Mail Server by [esminis](http://esminis.com)
============================================

This server is made of:

* [Postfix](http://www.postfix.org/) for SMTP
* [Virtualmail-pop3d (aka vm-pop3d)](http://www.reedmedia.net/software/virtualmail-pop3d/) for POP3
* [Tequila](http://www.loomsday.co.nz/development?id=tequila) for web administration interface

Quickstart
----------

Of course first download and install [Docker](https://docker.com/), then just run:

    docker pull esminis/mailserver ; docker run esminis/mailserver

Run modes
---------
* Run 

        docker run esminis/mailserver

* Run as daemon

        docker run -d esminis/mailserver

* Run as daemon exposing ports

        docker run -it -p 8443:8443 -p 25:25 -p 465:465 -p 995:995 esminis/mailserver

* Run and get into console

        docker run -it esminis/mailserver /bin/bash

Ports
-----

* 25 - SMTP
* 110 - POP3
* 465 - SMTP SSL (uses snakeoil certificate)
* 995 - POP3 SSL (uses snakeoil certificate)
* 8443 - Tequila SSL

Tequila
-------

Access web administration interface Tequila on [https://[ip]:8443](https://[ip]:8443)
Administrator user: admin
Administrator user password: x

Source
------

You can find source for building with Dockerfile here: https://bitbucket.org/esminis/mailserver

Building
--------

* Get build source from https://bitbucket.org/esminis/mailserver
* Go inside directory
* Build

        docker build .