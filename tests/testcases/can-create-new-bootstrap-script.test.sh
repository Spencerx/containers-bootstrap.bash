containers-bootstrap:script:new script /bin/ /usr/bin/

tests:ensure containers-bootstrap:script:print script
tests:assert-stdout "PATH=/bin/:/usr/bin/"
