# @description Creates new bootstrap script in the specified variable.
#
# Optionally, PATH directories can be provided as arguments.
#
# @example
#   containers-bootstrap:script:new script /bin/ /usr/bin/
#
# @arg $1 var Variable name.
# @arg $@ string PATH directories.
containers-bootstrap:script:new() {
    local __script__="$1"
    shift

    local __path__=("${@}")

    # eval prevents IFS to set globally
    IFS=':' eval '__path__="${__path__[*]:-}"'

    eval $__script__='("PATH=$__path__")'
}

# @description Adds user creation command to the bootstrap script.
#
# @example
#   containers-bootstrap:script:new script
#   containers-bootstrap:script:add-user finn -G wheel
#
# @arg $@ string useradd arguments, like '-G wheel'
containers-bootstrap:script:add-user() {
    local __script__="$1"
    shift

    local __user__="useradd ${@}"

    eval $__script__='("${'$__script__'[@]}" "$__user__")'
}

# @description Prints script specified by variable name.
#
# @exampple
#   containers-bootstrap:script:new script /bin/
#   containers-bootstrap:script:print script
#   # prints PATH=/bin/
#
# @arg $1 var Script variable.
# @stdout Compiled bootstrap script.
containers-bootstrap:script:print() {
    local __script__="$1"

    eval 'printf "%s\n" "${'$__script__'[@]}"'
}

# @description Adds command for creating new NOPASSWD sudoers file.
#
# @example
#   containers-bootstrap:script:new script
#   containers-bootstrap:script:add-nopasswd-sudoer script %wheel
#
# @arg $1 var Script variable.
# @arg $2 string Pattern for the sudoers file, like %wheel.
containers-bootstrap:script:add-nopasswd-sudoer() {
    local __script__="$1"
    local __pattern__="$2"
    local __file__="${3:-$__pattern__-nopasswd}"

    local __sudoer__="$__pattern__ ALL=(ALL) NOPASSWD: ALL"
    local __echo__="echo '$__sudoer__' > /etc/sudoers.d/$__file__"

    eval $__script__='("${'$__script__'[@]}" "$__echo__")'
}

# @description Adds commands for creating user home directories.
#
# @arg $1 var Script variable.
# @arg $2 string User name.
# @arg $@ string Directory names.
containers-bootstrap:script:add-user-directories() {
    local __script__="$1"
    local __user__="$2"
    shift 2

    local __mkdir__=()
    local __dirs__=('' "${@:-}")

    for __dir__ in ${__dirs__[@]}; do
        __mkdir__=(
            "${__mkdir__[@]:-}"
            "mkdir -p /home/$__user__/$__dir__"
            "chown -R $__user__: /home/$__user__/$__dir__"
        )
    done

    eval $__script__='("${'$__script__'[@]}" "${__mkdir__[@]}")'
}
