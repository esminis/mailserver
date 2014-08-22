Mail Server by [esminis](http://esminis.com)
============================================

This server is made of:  

* [Postfix](http://www.postfix.org/) for SMTP
* [Virtualmail-pop3d (aka vm-pop3d)](http://www.reedmedia.net/software/virtualmail-pop3d/) for POP3
* [Tequila](http://www.loomsday.co.nz/development?id=tequila) for web administration interface

Quickstart
----------

Of course first download and install [Docker](https://docker.com/), then just run:

    docker run X

Run modes
---------
* Run 
        
        docker run X
* Run as daemon
    
        docker run -d X
* Run and get into console

        docker run -it X /bin/bash

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

Building
--------

* Download and extract
* Go into directory

        cd X
* Build

        docker build .