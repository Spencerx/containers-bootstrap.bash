containers-bootstrap:script:new script /bin/ /usr/bin/

containers-bootstrap:script:add-user-directories script finn ".ssh"

tests:ensure containers-bootstrap:script:print script
tests:assert-stdout "mkdir -p /home/finn"
tests:assert-stdout "chown -R finn: /home/finn"
tests:assert-stdout "mkdir -p /home/finn/.ssh"
tests:assert-stdout "chown -R finn: /home/finn/.ssh"
