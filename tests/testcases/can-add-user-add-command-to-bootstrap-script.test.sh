containers-bootstrap:script:new script /bin/
containers-bootstrap:script:add-user script finn

tests:ensure containers-bootstrap:script:print script
tests:assert-stdout "useradd finn"

containers-bootstrap:script:add-user script fiona -G wheel

tests:ensure containers-bootstrap:script:print script
tests:assert-stdout "useradd fiona -G wheel"
