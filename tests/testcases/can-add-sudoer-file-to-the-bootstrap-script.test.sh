containers-bootstrap:script:new script /bin/ /usr/bin/

containers-bootstrap:script:add-nopasswd-sudoer script %wheel

tests:ensure containers-bootstrap:script:print script
tests:assert-stdout \
    "echo '%wheel ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/%wheel-nopasswd"

containers-bootstrap:script:add-nopasswd-sudoer script finn 00-finn

tests:ensure containers-bootstrap:script:print script
tests:assert-stdout \
    "echo 'finn ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/00-finn"
