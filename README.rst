Zope2
=====

A simple Zope2 server with enbedded ZODB.

The server will listen on port 8080.

Data storage
============

Data is stored in /var/opt/zope .

Build
-----

.. code-block:: Shell

  docker build --rm=true -t hub.bccvl.org.au/zope/zope:2.13.23 .

Publish
-------

.. code-block:: Shell

  docker push hub.bccvl.org.au/zope/zope:2.13.23
