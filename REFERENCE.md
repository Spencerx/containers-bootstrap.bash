
* [containers-bootstrap:script:new()](#containersbootstrapscriptnew)
* [containers-bootstrap:script:add-user()](#containersbootstrapscriptadduser)
* [containers-bootstrap:script:print()](#containersbootstrapscriptprint)
* [containers-bootstrap:script:add-nopasswd-sudoer()](#containersbootstrapscriptaddnopasswdsudoer)
* [containers-bootstrap:script:add-user-directories()](#containersbootstrapscriptadduserdirectories)


## containers-bootstrap:script:new()

Creates new bootstrap script in the specified variable.

Optionally, PATH directories can be provided as arguments.

#### Example

```bash
containers-bootstrap:script:new script /bin/ /usr/bin/
```

### Arguments

* **$1** (var): Variable name.
* **...** (string): PATH directories.

## containers-bootstrap:script:add-user()

Adds user creation command to the bootstrap script.

#### Example

```bash
containers-bootstrap:script:new script
containers-bootstrap:script:add-user finn -G wheel
```

### Arguments

* **...** (string): useradd arguments, like '-G wheel'

## containers-bootstrap:script:print()

Prints script specified by variable name.

### Arguments

* **$1** (var): Script variable.

### Output on stdout

* Compiled bootstrap script.

## containers-bootstrap:script:add-nopasswd-sudoer()

Adds command for creating new NOPASSWD sudoers file.

#### Example

```bash
containers-bootstrap:script:new script
containers-bootstrap:script:add-nopasswd-sudoer script %wheel
```

### Arguments

* **$1** (var): Script variable.
* **$2** (string): Pattern for the sudoers file, like %wheel.

## containers-bootstrap:script:add-user-directories()

Adds commands for creating user home directories.

### Arguments

* **$1** (var): Script variable.
* **$2** (string): User name.
* **...** (string): Directory names.

