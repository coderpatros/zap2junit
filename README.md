ZAP 2 JUnit
===========

Background
----------

I've started to incorporate a ZAP scan as part of my release process. After
new code hits the test environment it runs a ZAP scan as a gate before it
hits production.

We use Azure DevOps. It works quite well but has limitations on what artifacts
can be published as part of a release.

To be able to publish the results of the ZAP scan you need to convert the
output to one of the supported formats.

Given ZAP's heritage I decided to choose JUnit. Well, to be honest, I sort of
thought there would already be a tool to do the conversion.

Usage
-----

Any tool capable of transforming an XML file with a XSLT 2.0 file should do.

For example libsaxonb-java can be used to generate a file named `junit.xml` from a
file `zap.xml` like so...

    saxonb-xslt -xsl:zap2junit.xsl -s:zap.xml -o:junit.xml

This is what is used in my [docker-zap-scanner](https://github.com/patros/docker-zap-scanner) container.