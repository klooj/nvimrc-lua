-- for snippets.nvim; not working

local U = require'snippets.utils'
local snippets = require'snippets'
snippets.snippets = {
  ansible = {

    -- snippet add_host "Add a host (and alternatively a group) to the ansible-playbook in-memory inventory" b
    ["add_host"] = U.match_indentation [==[
    name=${1:# The hostname/ip of the host to add to the inventory, can include a colon and a port number.}
    groups=${3:# The groups to add the hostname to.}
    ]==];

    -- snippet apt "Manages apt-packages" b
    ["apt"] = U.match_indentation [==[
    allow_unauthenticated=${1:false}
    autoclean=${2:false}
    autoremove=${3:false}
    cache_valid_time=${4:0}
    deb=${5:# Path to a .deb package on the remote machine.If :// in the path, ansible will attempt to download deb before installing. (Version added 2.1)Requires the C(xz-utils) package to extract the control file of the deb package to install.}
    default_release=${6:# Corresponds to the C(-t) option for I(apt) and sets pin priorities}
    dpkg_options=${7:force-confdef,force-confold}
    force=${8:false}
    force_apt_get=${9:false}
    install_recommends=${10:# Corresponds to the C(--no-install-recommends) option for I(apt). C(yes) installs recommended packages.  C(no) does not install recommended packages. By default, Ansible will use the same defaults as the operating system. Suggested packages are never installed.}
    name=${11:# A list of package names, like C(foo), or package specifier with version, like C(foo=1.0). Name wildcards (fnmatch) like C(apt*) and version wildcards like C(foo=1.0*) are also supported.}
    only_upgrade=${12:false}
    policy_rc_d=${13:# Force the exit code of /usr/sbin/policy-rc.d.For example, if I(policy_rc_d=101) the installed package will not trigger a service start.If /usr/sbin/policy-rc.d already exist, it is backed up and restored after the package installation.If C(null), the /usr/sbin/policy-rc.d isn't created/changed.}
    purge=${14:false}
    state=${15:absent|build-dep|latest|#present|fixed}
    update_cache=${16:# Run the equivalent of C(apt-get update) before the operation. Can be run as part of the package installation or as a separate step.Default is not to update the cache.}
    update_cache_retries=${17:5}
    update_cache_retry_max_delay=${18:12}
    upgrade=${19:dist|full|#no|safe|yes}
    ]==];

    -- snippet apt_key "Add or remove an apt key" b
    ["apt_key"] = U.match_indentation [==[
    data=${1:# The keyfile contents to add to the keyring.}
    file=${2:# The path to a keyfile on the remote server to add to the keyring.}
    id=${3:# The identifier of the key.Including this allows check mode to correctly report the changed state.If specifying a subkey's id be aware that apt-key does not understand how to remove keys via a subkey id.  Specify the primary key's id instead.This parameter is required when C(state) is set to C(absent).}
    keyring=${4:# The full path to specific keyring file in /etc/apt/trusted.gpg.d/}
    keyserver=${5:# The keyserver to retrieve key from.}
    state=${6:absent|#present}
    url=${7:# The URL to retrieve key from.}
    validate_certs=${8:true}
    ]==];

    -- snippet apt_repository "Add and remove APT repositories" b
    ["apt_repository"] = U.match_indentation [==[
    repo=${1:# A source string for the repository.}
    codename=${3:# Override the distribution codename to use for PPA repositories. Should usually only be set when working with a PPA on a non-Ubuntu target (e.g. Debian or Mint)}
    filename=${4:# Sets the name of the source list file in sources.list.d. Defaults to a file name based on the repository source url. The .list extension will be automatically added.}
    mode=${5:0644}
    state=${6:absent|#present}
    update_cache=${7:true}
    update_cache_retries=${8:5}
    update_cache_retry_max_delay=${9:12}
    validate_certs=${10:true}
    ]==];

    -- snippet assemble "Assemble configuration files from fragments" b
    ["assemble"] = U.match_indentation [==[
    dest=${1:# A file to create using the concatenation of all of the source files.}
    src=${2:# An already existing directory full of source files.}
    attributes=${4:# The attributes the resulting file or directory should have.To get supported flags look at the man page for I(chattr) on the target system.This string should contain the attributes in the same order as the one displayed by I(lsattr).The C(=) operator is assumed as default, otherwise C(+) or C(-) operators need to be included in the string.}
    backup=${5:false}
    decrypt=${6:true}
    delimiter=${7:# A delimiter to separate the file contents.}
    group=${8:# Name of the group that should own the file/directory, as would be fed to I(chown).}
    ignore_hidden=${9:false}
    mode=${10:# The permissions the resulting file or directory should have.For those used to I(/usr/bin/chmod) remember that modes are actually octal numbers. You must either add a leading zero so that Ansible's YAML parser knows it is an octal number (like C(0644) or C(01777)) or quote it (like C('644') or C('1777')) so Ansible receives a string and can do its own conversion from string into number.Giving Ansible a number without following one of these rules will end up with a decimal number which will have unexpected re}
    owner=${11:# Name of the user that should own the file/directory, as would be fed to I(chown).}
    regexp=${12:# Assemble files only if C(regex) matches the filename.If not set, all files are assembled.Every '\\' (backslash) must be escaped as '\\\\' to comply to YAML syntax.Uses L(Python regular expressions,http://docs.python.org/2/library/re.html).}
    remote_src=${13:true}
    selevel=${14:# The level part of the SELinux file context.This is the MLS/MCS attribute, sometimes known as the C(range).When set to C(_default), it will use the C(level) portion of the policy if available.}
    serole=${15:# The role part of the SELinux file context.When set to C(_default), it will use the C(role) portion of the policy if available.}
    setype=${16:# The type part of the SELinux file context.When set to C(_default), it will use the C(type) portion of the policy if available.}
    seuser=${17:# The user part of the SELinux file context.By default it uses the C(system) policy, where applicable.When set to C(_default), it will use the C(user) portion of the policy if available.}
    unsafe_writes=${18:false}
    validate=${19:# The validation command to run before copying into place.The path to the file to validate is passed in via '%s' which must be present as in the sshd example below.The command is passed securely so shell features like expansion and pipes won't work.}
    ]==];

    -- snippet assert "Asserts given expressions are true" b
    ["assert"] = U.match_indentation [==[
    that=${1:# A list of string expressions of the same form that can be passed to the 'when' statement.}
    fail_msg=${3:# The customized message used for a failing assertion.This argument was called 'msg' before Ansible 2.7, now it is renamed to 'fail_msg' with alias 'msg'.}
    quiet=${4:false}
    success_msg=${5:# The customized message used for a successful assertion.}
    ]==];

    -- snippet async_status "Obtain status of asynchronous task" b
    ["async_status"] = U.match_indentation [==[
    jid=${1:# Job or task identifier}
    mode=${3:cleanup|#status}
    ]==];

    -- snippet blockinfile "Insert/update/remove a text block surrounded by marker lines" b
    ["blockinfile"] = U.match_indentation [==[
    path=${1:# The file to modify.Before Ansible 2.3 this option was only usable as I(dest), I(destfile) and I(name).}
    attributes=${3:# The attributes the resulting file or directory should have.To get supported flags look at the man page for I(chattr) on the target system.This string should contain the attributes in the same order as the one displayed by I(lsattr).The C(=) operator is assumed as default, otherwise C(+) or C(-) operators need to be included in the string.}
    backup=${4:false}
    block=${5:""}
    create=${6:false}
    group=${7:# Name of the group that should own the file/directory, as would be fed to I(chown).}
    insertafter=${8:#EOF|*regex*}
    insertbefore=${9:BOF|*regex*}
    marker=${10:# \{mark\} ANSIBLE MANAGED BLOCK}
    marker_begin=${11:BEGIN}
    marker_end=${12:END}
    mode=${13:# The permissions the resulting file or directory should have.For those used to I(/usr/bin/chmod) remember that modes are actually octal numbers. You must either add a leading zero so that Ansible's YAML parser knows it is an octal number (like C(0644) or C(01777)) or quote it (like C('644') or C('1777')) so Ansible receives a string and can do its own conversion from string into number.Giving Ansible a number without following one of these rules will end up with a decimal number which will have unexpected re}
    owner=${14:# Name of the user that should own the file/directory, as would be fed to I(chown).}
    selevel=${15:# The level part of the SELinux file context.This is the MLS/MCS attribute, sometimes known as the C(range).When set to C(_default), it will use the C(level) portion of the policy if available.}
    serole=${16:# The role part of the SELinux file context.When set to C(_default), it will use the C(role) portion of the policy if available.}
    setype=${17:# The type part of the SELinux file context.When set to C(_default), it will use the C(type) portion of the policy if available.}
    seuser=${18:# The user part of the SELinux file context.By default it uses the C(system) policy, where applicable.When set to C(_default), it will use the C(user) portion of the policy if available.}
    state=${19:absent|#present}
    unsafe_writes=${20:false}
    validate=${21:# The validation command to run before copying into place.The path to the file to validate is passed in via '%s' which must be present as in the examples below.The command is passed securely so shell features like expansion and pipes will not work.}
    ]==];

    -- snippet command "Execute commands on targets" b
    ["command"] = U.match_indentation [==[
    argv=${1:# Passes the command as a list rather than a string.Use C(argv) to avoid quoting values that would otherwise be interpreted incorrectly (for example 'user name').Only the string (free form) or the list (argv) form can be provided, not both.  One or the other must be provided.}
    chdir=${2:# Change into this directory before running the command.}
    cmd=${3:# The command to run.}
    creates=${4:# A filename or (since 2.0) glob pattern. If a matching file already exists, this step B(won't) be run.}
    ${5:free_form=# The command module takes a free form string as a command to run.There is no actual parameter named 'free form'.}
    removes=${6:# A filename or (since 2.0) glob pattern. If a matching file exists, this step B(will) be run.}
    stdin=${7:# Set the stdin of the command directly to the specified value.}
    stdin_add_newline=${8:true}
    strip_empty_ends=${9:true}
    warn=${10:true}
    ]==];

    -- snippet copy "Copy files to remote locations" b
    ["copy"] = U.match_indentation [==[
    dest=${1:# Remote absolute path where the file should be copied to.If C(src) is a directory, this must be a directory too.If C(dest) is a non-existent path and if either C(dest) ends with '/' or C(src) is a directory, C(dest) is created.If I(dest) is a relative path, the starting directory is determined by the remote host.If C(src) and C(dest) are files, the parent directory of C(dest) is not created and the task fails if it does not already exist.}
    attributes=${3:# The attributes the resulting file or directory should have.To get supported flags look at the man page for I(chattr) on the target system.This string should contain the attributes in the same order as the one displayed by I(lsattr).The C(=) operator is assumed as default, otherwise C(+) or C(-) operators need to be included in the string.}
    backup=${4:false}
    checksum=${5:# SHA1 checksum of the file being transferred.Used to validate that the copy of the file was successful.If this is not provided, ansible will use the local calculated checksum of the src file.}
    content=${6:# When used instead of C(src), sets the contents of a file directly to the specified value.Works only when C(dest) is a file. Creates the file if it does not exist.For advanced formatting or if C(content) contains a variable, use the M(ansible.builtin.template) module.}
    decrypt=${7:true}
    directory_mode=${8:# When doing a recursive copy set the mode for the directories.If this is not set we will use the system defaults.The mode is only set on directories which are newly created, and will not affect those that already existed.}
    follow=${9:false}
    force=${10:true}
    group=${11:# Name of the group that should own the file/directory, as would be fed to I(chown).}
    local_follow=${12:true}
    mode=${13:# The permissions of the destination file or directory.For those used to C(/usr/bin/chmod) remember that modes are actually octal numbers. You must either add a leading zero so that Ansible's YAML parser knows it is an octal number (like C(0644) or C(01777))or quote it (like C('644') or C('1777')) so Ansible receives a string and can do its own conversion from string into number. Giving Ansible a number without following one of these rules will end up with a decimal number which will have unexpected results.A}
    owner=${14:# Name of the user that should own the file/directory, as would be fed to I(chown).}
    remote_src=${15:false}
    selevel=${16:# The level part of the SELinux file context.This is the MLS/MCS attribute, sometimes known as the C(range).When set to C(_default), it will use the C(level) portion of the policy if available.}
    serole=${17:# The role part of the SELinux file context.When set to C(_default), it will use the C(role) portion of the policy if available.}
    setype=${18:# The type part of the SELinux file context.When set to C(_default), it will use the C(type) portion of the policy if available.}
    seuser=${19:# The user part of the SELinux file context.By default it uses the C(system) policy, where applicable.When set to C(_default), it will use the C(user) portion of the policy if available.}
    src=${20:# Local path to a file to copy to the remote server.This can be absolute or relative.If path is a directory, it is copied recursively. In this case, if path ends with '/', only inside contents of that directory are copied to destination. Otherwise, if it does not end with '/', the directory itself with all contents is copied. This behavior is similar to the C(rsync) command line tool.}
    unsafe_writes=${21:false}
    validate=${22:# The validation command to run before copying into place.The path to the file to validate is passed in via '%s' which must be present as in the examples below.The command is passed securely so shell features like expansion and pipes will not work.}
    ]==];

    -- snippet cron "Manage cron.d and crontab entries" b
    ["cron"] = U.match_indentation [==[
    backup=${1:false}
    cron_file=${2:# If specified, uses this file instead of an individual user's crontab.If this is a relative path, it is interpreted with respect to I(/etc/cron.d).If it is absolute, it will typically be I(/etc/crontab).Many linux distros expect (and some require) the filename portion to consist solely of upper- and lower-case letters, digits, underscores, and hyphens.To use the C(cron_file) parameter you must specify the C(user) as well.}
    day=${3:*}
    disabled=${4:false}
    env=${5:false}
    hour=${6:*}
    insertafter=${7:# Used with C(state=present) and C(env).If specified, the environment variable will be inserted after the declaration of specified environment variable.}
    insertbefore=${8:# Used with C(state=present) and C(env).If specified, the environment variable will be inserted before the declaration of specified environment variable.}
    job=${9:# The command to execute or, if env is set, the value of environment variable.The command should not contain line breaks.Required if C(state=present).}
    minute=${10:*}
    month=${11:*}
    name=${12:# Description of a crontab entry or, if env is set, the name of environment variable.Required if C(state=absent).Note that if name is not set and C(state=present), then a new crontab entry will always be created, regardless of existing ones.This parameter will always be required in future releases.}
    reboot=${13:false}
    special_time=${14:annually|daily|hourly|monthly|reboot|weekly|yearly}
    state=${15:absent|#present}
    user=${16:# The specific user whose crontab should be modified.When unset, this parameter defaults to the current user.}
    weekday=${17:*}
    ]==];

    -- snippet debconf "Configure a .deb package" b
    ["debconf"] = U.match_indentation [==[
    name=${1:# Name of package to configure.}
    question=${3:# A debconf configuration setting.}
    unseen=${4:false}
    value=${5:# Value to set the configuration to.}
    vtype=${6:boolean|error|multiselect|note|password|seen|select|string|text|title}
    ]==];

    -- snippet debug "Print statements during execution" b
    ["debug"] = U.match_indentation [==[
    msg=${1:Hello world!}
    var=${2:# A variable name to debug.Mutually exclusive with the C(msg) option.Be aware that this option already runs in Jinja2 context and has an implicit C(\{\{ \}\}) wrapping, so you should not be using Jinja2 delimiters unless you are looking for double interpolation.}
    verbosity=${3:0}
    ]==];

    -- snippet dnf "Manages packages with the I(dnf) package manager" b
    ["dnf"] = U.match_indentation [==[
    name=${1:# A package name or package specifier with version, like C(name-1.0). When using state=latest, this can be '*' which means run: dnf -y update. You can also pass a url or a local path to a rpm file. To operate on several packages this can accept a comma separated string of packages or a list of packages.}
    allow_downgrade=${3:false}
    allowerasing=${4:false}
    autoremove=${5:false}
    bugfix=${6:false}
    conf_file=${7:# The remote dnf configuration file to use for the transaction.}
    disable_excludes=${8:# Disable the excludes defined in DNF config files.If set to C(all), disables all excludes.If set to C(main), disable excludes defined in [main] in dnf.conf.If set to C(repoid), disable excludes defined for given repo id.}
    disable_gpg_check=${9:false}
    disable_plugin=${10:# I(Plugin) name to disable for the install/update operation. The disabled plugins will not persist beyond the transaction.}
    disablerepo=${11:# I(Repoid) of repositories to disable for the install/update operation. These repos will not persist beyond the transaction. When specifying multiple repos, separate them with a ','.}
    download_dir=${12:# Specifies an alternate directory to store packages.Has an effect only if I(download_only) is specified.}
    download_only=${13:false}
    enable_plugin=${14:# I(Plugin) name to enable for the install/update operation. The enabled plugin will not persist beyond the transaction.}
    enablerepo=${15:# I(Repoid) of repositories to enable for the install/update operation. These repos will not persist beyond the transaction. When specifying multiple repos, separate them with a ','.}
    exclude=${16:# Package name(s) to exclude when state=present, or latest. This can be a list or a comma separated string.}
    install_repoquery=${17:true}
    install_weak_deps=${18:true}
    installroot=${19:/}
    list=${20:# Various (non-idempotent) commands for usage with C(/usr/bin/ansible) and I(not) playbooks. See examples.}
    lock_timeout=${21:30}
    releasever=${22:# Specifies an alternative release from which all packages will be installed.}
    security=${23:false}
    skip_broken=${24:false}
    state=${25:absent|present|installed|removed|latest}
    update_cache=${26:false}
    update_only=${27:false}
    validate_certs=${28:true}
    ]==];

    -- snippet dpkg_selections "Dpkg package selection selections" b
    ["dpkg_selections"] = U.match_indentation [==[
    name=${1:# Name of the package}
    selection=${2:install|hold|deinstall|purge}
    ]==];

    -- snippet expect "Executes a command and responds to prompts." b
    ["expect"] = U.match_indentation [==[
    command=${1:# The command module takes command to run.}
    responses=${2:# Mapping of expected string/regex and string to respond with. If the response is a list, successive matches return successive responses. List functionality is new in 2.1.}
    chdir=${4:# Change into this directory before running the command.}
    creates=${5:# A filename, when it already exists, this step will B(not) be run.}
    echo=${6:false}
    removes=${7:# A filename, when it does not exist, this step will B(not) be run.}
    timeout=${8:30}
    ]==];

    -- snippet fail "Fail with custom message" b
    ["fail"] = U.match_indentation [==[
    msg=${1:Failed as requested from task}
    ]==];

    -- snippet fetch "Fetch files from remote nodes" b
    ["fetch"] = U.match_indentation [==[
    dest=${1:# A directory to save the file into.For example, if the I(dest) directory is C(/backup) a I(src) file named C(/etc/profile) on host C(host.example.com), would be saved into C(/backup/host.example.com/etc/profile). The host name is based on the inventory name.}
    src=${2:# The file on the remote system to fetch.This I(must) be a file, not a directory.Recursive fetching may be supported in a later release.}
    fail_on_missing=${4:true}
    flat=${5:false}
    validate_checksum=${6:true}
    ]==];

    -- snippet file "Manage files and file properties" b
    ["file"] = U.match_indentation [==[
    path=${1:# Path to the file being managed.}
    access_time=${3:# This parameter indicates the time the file's access time should be set to.Should be C(preserve) when no modification is required, C(YYYYMMDDHHMM.SS) when using default time format, or C(now).Default is C(None) meaning that C(preserve) is the default for C(state=[file,directory,link,hard]) and C(now) is default for C(state=touch).}
    access_time_format=${4:%Y%m%d%H%M.%S}
    attributes=${5:# The attributes the resulting file or directory should have.To get supported flags look at the man page for I(chattr) on the target system.This string should contain the attributes in the same order as the one displayed by I(lsattr).The C(=) operator is assumed as default, otherwise C(+) or C(-) operators need to be included in the string.}
    follow=${6:true}
    force=${7:false}
    group=${8:# Name of the group that should own the file/directory, as would be fed to I(chown).}
    mode=${9:# The permissions the resulting file or directory should have.For those used to I(/usr/bin/chmod) remember that modes are actually octal numbers. You must either add a leading zero so that Ansible's YAML parser knows it is an octal number (like C(0644) or C(01777)) or quote it (like C('644') or C('1777')) so Ansible receives a string and can do its own conversion from string into number.Giving Ansible a number without following one of these rules will end up with a decimal number which will have unexpected re}
    modification_time=${10:# This parameter indicates the time the file's modification time should be set to.Should be C(preserve) when no modification is required, C(YYYYMMDDHHMM.SS) when using default time format, or C(now).Default is None meaning that C(preserve) is the default for C(state=[file,directory,link,hard]) and C(now) is default for C(state=touch).}
    modification_time_format=${11:%Y%m%d%H%M.%S}
    owner=${12:# Name of the user that should own the file/directory, as would be fed to I(chown).}
    recurse=${13:false}
    selevel=${14:# The level part of the SELinux file context.This is the MLS/MCS attribute, sometimes known as the C(range).When set to C(_default), it will use the C(level) portion of the policy if available.}
    serole=${15:# The role part of the SELinux file context.When set to C(_default), it will use the C(role) portion of the policy if available.}
    setype=${16:# The type part of the SELinux file context.When set to C(_default), it will use the C(type) portion of the policy if available.}
    seuser=${17:# The user part of the SELinux file context.By default it uses the C(system) policy, where applicable.When set to C(_default), it will use the C(user) portion of the policy if available.}
    src=${18:# Path of the file to link to.This applies only to C(state=link) and C(state=hard).For C(state=link), this will also accept a non-existing path.Relative paths are relative to the file being created (C(path)) which is how the Unix command C(ln -s SRC DEST) treats relative paths.}
    state=${19:absent|directory|#file|hard|link|touch}
    unsafe_writes=${20:false}
    ]==];

    -- snippet find "Return a list of files based on specific criteria" b
    ["find"] = U.match_indentation [==[
    paths=${1:# List of paths of directories to search. All paths must be fully qualified.}
    age=${3:# Select files whose age is equal to or greater than the specified time.Use a negative age to find files equal to or less than the specified time.You can choose seconds, minutes, hours, days, or weeks by specifying the first letter of any of those words (e.g., '1w').}
    age_stamp=${4:atime|ctime|#mtime}
    contains=${5:# A regular expression or pattern which should be matched against the file content.}
    depth=${6:# Set the maximum number of levels to descend into.Setting recurse to C(no) will override this value, which is effectively depth 1.Default is unlimited depth.}
    excludes=${7:# One or more (shell or regex) patterns, which type is controlled by C(use_regex) option.Items whose basenames match an C(excludes) pattern are culled from C(patterns) matches. Multiple patterns can be specified using a list.}
    file_type=${8:any|directory|#file|link}
    follow=${9:false}
    get_checksum=${10:false}
    hidden=${11:false}
    patterns=${12:*}
    recurse=${13:false}
    size=${14:# Select files whose size is equal to or greater than the specified size.Use a negative size to find files equal to or less than the specified size.Unqualified values are in bytes but b, k, m, g, and t can be appended to specify bytes, kilobytes, megabytes, gigabytes, and terabytes, respectively.Size is not evaluated for directories.}
    use_regex=${15:false}
    ]==];

    -- snippet gather_facts "Gathers facts about remote hosts" b
    ["gather_facts"] = U.match_indentation [==[
    parallel=${1:# A toggle that controls if the fact modules are executed in parallel or serially and in order. This can guarantee the merge order of module facts at the expense of performance.By default it will be true if more than one fact module is used.}
    ]==];

    -- snippet get_url "Downloads files from HTTP, HTTPS, or FTP to node" b
    ["get_url"] = U.match_indentation [==[
    dest=${1:# Absolute path of where to download the file to.If C(dest) is a directory, either the server provided filename or, if none provided, the base name of the URL on the remote server will be used. If a directory, C(force) has no effect.If C(dest) is a directory, the file will always be downloaded (regardless of the C(force) option), but replaced only if the contents changed..}
    url=${2:# HTTP, HTTPS, or FTP URL in the form (http|https|ftp)://[user[:pass]]@host.domain[:port]/path}
    attributes=${4:# The attributes the resulting file or directory should have.To get supported flags look at the man page for I(chattr) on the target system.This string should contain the attributes in the same order as the one displayed by I(lsattr).The C(=) operator is assumed as default, otherwise C(+) or C(-) operators need to be included in the string.}
    backup=${5:false}
    checksum=${6:""}
    client_cert=${7:# PEM formatted certificate chain file to be used for SSL client authentication.This file can also include the key as well, and if the key is included, C(client_key) is not required.}
    client_key=${8:# PEM formatted file that contains your private key to be used for SSL client authentication.If C(client_cert) contains both the certificate and key, this option is not required.}
    force=${9:false}
    force_basic_auth=${10:false}
    group=${11:# Name of the group that should own the file/directory, as would be fed to I(chown).}
    headers=${12:# Add custom HTTP headers to a request in hash/dict format.The hash/dict format was added in Ansible 2.6.Previous versions used a C('key:value,key:value') string format.The C('key:value,key:value') string format is deprecated and has been removed in version 2.10.}
    http_agent=${13:ansible-httpget}
    mode=${14:# The permissions the resulting file or directory should have.For those used to I(/usr/bin/chmod) remember that modes are actually octal numbers. You must either add a leading zero so that Ansible's YAML parser knows it is an octal number (like C(0644) or C(01777)) or quote it (like C('644') or C('1777')) so Ansible receives a string and can do its own conversion from string into number.Giving Ansible a number without following one of these rules will end up with a decimal number which will have unexpected re}
    owner=${15:# Name of the user that should own the file/directory, as would be fed to I(chown).}
    selevel=${16:# The level part of the SELinux file context.This is the MLS/MCS attribute, sometimes known as the C(range).When set to C(_default), it will use the C(level) portion of the policy if available.}
    serole=${17:# The role part of the SELinux file context.When set to C(_default), it will use the C(role) portion of the policy if available.}
    setype=${18:# The type part of the SELinux file context.When set to C(_default), it will use the C(type) portion of the policy if available.}
    seuser=${19:# The user part of the SELinux file context.By default it uses the C(system) policy, where applicable.When set to C(_default), it will use the C(user) portion of the policy if available.}
    sha256sum=${20:""}
    timeout=${21:10}
    tmp_dest=${22:# Absolute path of where temporary file is downloaded to.When run on Ansible 2.5 or greater, path defaults to ansible's remote_tmp settingWhen run on Ansible prior to 2.5, it defaults to C(TMPDIR), C(TEMP) or C(TMP) env variables or a platform specific value.U(https://docs.python.org/2/library/tempfile.html#tempfile.tempdir)}
    unsafe_writes=${23:false}
    url_password=${24:# The password for use in HTTP basic authentication.If the C(url_username) parameter is not specified, the C(url_password) parameter will not be used.Since version 2.8 you can also use the 'password' alias for this option.}
    url_username=${25:# The username for use in HTTP basic authentication.This parameter can be used without C(url_password) for sites that allow empty passwords.Since version 2.8 you can also use the C(username) alias for this option.}
    use_proxy=${26:true}
    validate_certs=${27:true}
    ]==];

    -- snippet getent "A wrapper to the unix getent utility" b
    ["getent"] = U.match_indentation [==[
    database=${1:# The name of a getent database supported by the target system (passwd, group, hosts, etc).}
    fail_key=${3:true}
    key=${4:""}
    service=${5:# Override all databases with the specified serviceThe underlying system must support the service flag which is not always available.}
    split=${6:# Character used to split the database values into lists/arrays such as ':' or '  ', otherwise  it will try to pick one depending on the database.}
    ]==];

    -- snippet git "Deploy software (or files) from git checkouts" b
    ["git"] = U.match_indentation [==[
    dest=${1:# The path of where the repository should be checked out. This parameter is required, unless C(clone) is set to C(no).}
    repo=${2:# git, SSH, or HTTP(S) protocol address of the git repository.}
    accept_hostkey=${4:false}
    archive=${5:# Specify archive file path with extension. If specified, creates an archive file of the specified format containing the tree structure for the source tree. Allowed archive formats ['zip', 'tar.gz', 'tar', 'tgz']This will clone and perform git archive from local directory as not all git servers support git archive.}
    archive_prefix=${6:# Specify a prefix to add to each file path in archive. Requires C(archive) to be specified.}
    bare=${7:false}
    clone=${8:true}
    depth=${9:# Create a shallow clone with a history truncated to the specified number or revisions. The minimum possible value is C(1), otherwise ignored. Needs I(git>=1.9.1) to work correctly.}
    executable=${10:# Path to git executable to use. If not supplied, the normal mechanism for resolving binary paths will be used.}
    force=${11:false}
    gpg_whitelist=${12:[]}
    key_file=${13:# Specify an optional private key file path, on the target host, to use for the checkout.}
    recursive=${14:true}
    reference=${15:# Reference repository (see 'git clone
    --reference ...')}
    refspec=${16:# Add an additional refspec to be fetched. If version is set to a I(SHA-1) not reachable from any branch or tag, this option may be necessary to specify the ref containing the I(SHA-1). Uses the same syntax as the 'git fetch' command. An example value could be 'refs/meta/config'.}
    remote=${17:origin}
    separate_git_dir=${18:# The path to place the cloned repository. If specified, Git repository can be separated from working tree.}
    ssh_opts=${19:# Creates a wrapper script and exports the path as GIT_SSH which git then automatically uses to override ssh arguments. An example value could be '-o StrictHostKeyChecking=no' (although this particular option is better set via C(accept_hostkey)).}
    track_submodules=${20:false}
    umask=${21:# The umask to set before doing any checkouts, or any other repository maintenance.}
    update=${22:true}
    verify_commit=${23:false}
    version=${24:HEAD}
    ]==];

    -- snippet group "Add or remove groups" b
    ["group"] = U.match_indentation [==[
    name=${1:# Name of the group to manage.}
    gid=${3:# Optional I(GID) to set for the group.}
    local=${4:false}
    non_unique=${5:false}
    state=${6:absent|#present}
    system=${7:false}
    ]==];

    -- snippet group_by "Create Ansible groups based on facts" b
    ["group_by"] = U.match_indentation [==[
    key=${1:# The variables whose values will be used as groups.}
    parents=${3:all}
    ]==];

    -- snippet hostname "Manage hostname" b
    ["hostname"] = U.match_indentation [==[
    name=${1:# Name of the host}
    use=${3:generic|debian|sles|redhat|alpine|systemd|openrc|openbsd|solaris|freebsd}
    ]==];

    -- snippet import_playbook "Import a playbook" b
    ["import_playbook"] = U.match_indentation [==[
    free-form=${1:# The name of the imported playbook is specified directly without any other option.}
    ]==];

    -- snippet import_role "Import a role into a play" b
    ["import_role"] = U.match_indentation [==[
    name=${1:# The name of the role to be executed.}
    allow_duplicates=${3:true}
    defaults_from=${4:main}
    handlers_from=${5:main}
    tasks_from=${6:main}
    vars_from=${7:main}
    ]==];

    -- snippet import_tasks "Import a task list" b
    ["import_tasks"] = U.match_indentation [==[
    free-form=${1:# The name of the imported file is specified directly without any other option.Most keywords, including loops and conditionals, only applied to the imported tasks, not to this statement itself.If you need any of those to apply, use M(ansible.builtin.include_tasks) instead.}
    ]==];

    -- snippet include "Include a play or task list" b
    ["include"] = U.match_indentation [==[
    free-form=${1:# This module allows you to specify the name of the file directly without any other options.}
    ]==];

    -- snippet include_role "Load and execute a role" b
    ["include_role"] = U.match_indentation [==[
    name=${1:# The name of the role to be executed.}
    allow_duplicates=${3:true}
    apply=${4:# Accepts a hash of task keywords (e.g. C(tags), C(become)) that will be applied to all tasks within the included role.}
    defaults_from=${5:main}
    handlers_from=${6:main}
    public=${7:false}
    tasks_from=${8:main}
    vars_from=${9:main}
    ]==];

    -- snippet include_tasks "Dynamically include a task list" b
    ["include_tasks"] = U.match_indentation [==[
    apply=${1:# Accepts a hash of task keywords (e.g. C(tags), C(become)) that will be applied to the tasks within the include.}
    file=${2:# The name of the imported file is specified directly without any other option.Unlike M(ansible.builtin.import_tasks), most keywords, including loop, with_items, and conditionals, apply to this statement.The do until loop is not supported on M(ansible.builtin.include_tasks).}
    free-form=${3:# Supplying a file name via free-form C(- include_tasks: file.yml) of a file to be included is the equivalent
    of specifying an argument of I(file)}
    ]==];

    -- snippet include_vars "Load variables from files, dynamically within a task" b
    ["include_vars"] = U.match_indentation [==[
    depth=${1:0}
    dir=${2:# The directory name from which the variables should be loaded.If the path is relative and the task is inside a role, it will look inside the role's vars/ subdirectory.If the path is relative and not inside a role, it will be parsed relative to the playbook.}
    extensions=${3:['json', 'yaml', 'yml']}
    file=${4:# The file name from which variables should be loaded.If the path is relative, it will look for the file in vars/ subdirectory of a role or relative to playbook.}
    files_matching=${5:# Limit the files that are loaded within any directory to this regular expression.}
    free-form=${6:# This module allows you to specify the 'file' option directly without any other options.There is no 'free-form' option, this is just an indicator, see example below.}
    ignore_files=${7:# List of file names to ignore.}
    ignore_unknown_extensions=${8:false}
    name=${9:# The name of a variable into which assign the included vars.If omitted (null) they will be made top level vars.}
    ]==];

    -- snippet iptables "Modify iptables rules" b
    ["iptables"] = U.match_indentation [==[
    action=${1:#append|insert}
    chain=${2:# Specify the iptables chain to modify.This could be a user-defined chain or one of the standard iptables chains, like C(INPUT), C(FORWARD), C(OUTPUT), C(PREROUTING), C(POSTROUTING), C(SECMARK) or C(CONNSECMARK).}
    comment=${3:# This specifies a comment that will be added to the rule.}
    ctstate=${4:[]}
    destination=${5:# Destination specification.Address can be either a network name, a hostname, a network IP address (with /mask), or a plain IP address.Hostnames will be resolved once only, before the rule is submitted to the kernel. Please note that specifying any name to be resolved with a remote query such as DNS is a really bad idea.The mask can be either a network mask or a plain number, specifying the number of 1's at the left side of the network mask. Thus, a mask of 24 is equivalent to 255.255.255.0. A C(!) argument b}
    destination_port=${6:# Destination port or port range specification. This can either be a service name or a port number. An inclusive range can also be specified, using the format first:last. If the first port is omitted, '0' is assumed; if the last is omitted, '65535' is assumed. If the first port is greater than the second one they will be swapped. This is only valid if the rule also specifies one of the following protocols: tcp, udp, dccp or sctp.}
    dst_range=${7:# Specifies the destination IP range to match in the iprange module.}
    flush=${8:false}
    fragment=${9:# This means that the rule only refers to second and further fragments of fragmented packets.Since there is no way to tell the source or destination ports of such a packet (or ICMP type), such a packet will not match any rules which specify them.When the '!' argument precedes fragment argument, the rule will only match head fragments, or unfragmented packets.}
    gateway=${10:# This specifies the IP address of host to send the cloned packets.This option is only valid when C(jump) is set to C(TEE).}
    gid_owner=${11:# Specifies the GID or group to use in match by owner rule.}
    goto=${12:# This specifies that the processing should continue in a user specified chain.Unlike the jump argument return will not continue processing in this chain but instead in the chain that called us via jump.}
    icmp_type=${13:# This allows specification of the ICMP type, which can be a numeric ICMP type, type/code pair, or one of the ICMP type names shown by the command 'iptables -p icmp -h'}
    in_interface=${14:# Name of an interface via which a packet was received (only for packets entering the C(INPUT), C(FORWARD) and C(PREROUTING) chains).When the C(!) argument is used before the interface name, the sense is inverted.If the interface name ends in a C(+), then any interface which begins with this name will match.If this option is omitted, any interface name will match.}
    ip_version=${15:#ipv4|ipv6}
    jump=${16:# This specifies the target of the rule; i.e., what to do if the packet matches it.The target can be a user-defined chain (other than the one this rule is in), one of the special builtin targets which decide the fate of the packet immediately, or an extension (see EXTENSIONS below).If this option is omitted in a rule (and the goto parameter is not used), then matching the rule will have no effect on the packet's fate, but the counters on the rule will be incremented.}
    limit=${17:# Specifies the maximum average number of matches to allow per second.The number can specify units explicitly, using \`/second', \`/minute', \`/hour' or \`/day', or parts of them (so \`5/second' is the same as \`5/s').}
    limit_burst=${18:# Specifies the maximum burst before the above limit kicks in.}
    log_level=${19:0|1|2|3|4|5|6|7|emerg|alert|crit|error|warning|notice|info|debug}
    log_prefix=${20:# Specifies a log text for the rule. Only make sense with a LOG jump.}
    match=${21:[]}
    out_interface=${22:# Name of an interface via which a packet is going to be sent (for packets entering the C(FORWARD), C(OUTPUT) and C(POSTROUTING) chains).When the C(!) argument is used before the interface name, the sense is inverted.If the interface name ends in a C(+), then any interface which begins with this name will match.If this option is omitted, any interface name will match.}
    policy=${23:ACCEPT|DROP|QUEUE|RETURN}
    protocol=${24:# The protocol of the rule or of the packet to check.The specified protocol can be one of C(tcp), C(udp), C(udplite), C(icmp), C(ipv6-icmp) or C(icmpv6), C(esp), C(ah), C(sctp) or the special keyword C(all), or it can be a numeric value, representing one of these protocols or a different one.A protocol name from I(/etc/protocols) is also allowed.A C(!) argument before the protocol inverts the test.The number zero is equivalent to all.C(all) will match with all protocols and is taken as default when this optio}
    reject_with=${25:# Specifies the error packet type to return while rejecting. It implies 'jump: REJECT'}
    rule_num=${26:# Insert the rule as the given rule number.This works only with C(action=insert).}
    set_counters=${27:# This enables the administrator to initialize the packet and byte counters of a rule (during C(INSERT), C(APPEND), C(REPLACE) operations).}
    set_dscp_mark=${28:# This allows specifying a DSCP mark to be added to packets. It takes either an integer or hex value.Mutually exclusive with C(set_dscp_mark_class).}
    set_dscp_mark_class=${29:# This allows specifying a predefined DiffServ class which will be translated to the corresponding DSCP mark.Mutually exclusive with C(set_dscp_mark).}
    source=${30:# Source specification.Address can be either a network name, a hostname, a network IP address (with /mask), or a plain IP address.Hostnames will be resolved once only, before the rule is submitted to the kernel. Please note that specifying any name to be resolved with a remote query such as DNS is a really bad idea.The mask can be either a network mask or a plain number, specifying the number of 1's at the left side of the network mask. Thus, a mask of 24 is equivalent to 255.255.255.0. A C(!) argument before}
    source_port=${31:# Source port or port range specification.This can either be a service name or a port number.An inclusive range can also be specified, using the format C(first:last).If the first port is omitted, C(0) is assumed; if the last is omitted, C(65535) is assumed.If the first port is greater than the second one they will be swapped.}
    src_range=${32:# Specifies the source IP range to match in the iprange module.}
    state=${33:absent|#present}
    syn=${34:#ignore|match|negate}
    table=${35:#filter|nat|mangle|raw|security}
    tcp_flags=${36:{}}
    to_destination=${37:# This specifies a destination address to use with C(DNAT).Without this, the destination address is never altered.}
    to_ports=${38:# This specifies a destination port or range of ports to use, without this, the destination port is never altered.This is only valid if the rule also specifies one of the protocol C(tcp), C(udp), C(dccp) or C(sctp).}
    to_source=${39:# This specifies a source address to use with C(SNAT).Without this, the source address is never altered.}
    uid_owner=${40:# Specifies the UID or username to use in match by owner rule.From Ansible 2.6 when the C(!) argument is prepended then the it inverts the rule to apply instead to all users except that one specified.}
    wait=${41:# Wait N seconds for the xtables lock to prevent multiple instances of the program from running concurrently.}
    ]==];

    -- snippet known_hosts "Add or remove a host from the C(known_hosts) file" b
    ["known_hosts"] = U.match_indentation [==[
    name=${1:# The host to add or remove (must match a host specified in key). It will be converted to lowercase so that ssh-keygen can find it.Must match with <hostname> or <ip> present in key attribute.For custom SSH port, C(name) needs to specify port as well. See example section.}
    hash_host=${3:false}
    key=${4:# The SSH public host key, as a string.Required if C(state=present), optional when C(state=absent), in which case all keys for the host are removed.The key must be in the right format for SSH (see sshd(8), section 'SSH_KNOWN_HOSTS FILE FORMAT').Specifically, the key should not match the format that is found in an SSH pubkey file, but should rather have the hostname prepended to a line that includes the pubkey, the same way that it would appear in the known_hosts file. The value prepended to the line must also}
    path=${5:~/.ssh/known_hosts}
    state=${6:absent|#present}
    ]==];

    -- snippet lineinfile "Manage lines in text files" b
    ["lineinfile"] = U.match_indentation [==[
    path=${1:# The file to modify.Before Ansible 2.3 this option was only usable as I(dest), I(destfile) and I(name).}
    attributes=${3:# The attributes the resulting file or directory should have.To get supported flags look at the man page for I(chattr) on the target system.This string should contain the attributes in the same order as the one displayed by I(lsattr).The C(=) operator is assumed as default, otherwise C(+) or C(-) operators need to be included in the string.}
    backrefs=${4:false}
    backup=${5:false}
    create=${6:false}
    firstmatch=${7:false}
    group=${8:# Name of the group that should own the file/directory, as would be fed to I(chown).}
    insertafter=${9:#EOF|*regex*}
    insertbefore=${10:BOF|*regex*}
    line=${11:# The line to insert/replace into the file.Required for C(state=present).If C(backrefs) is set, may contain backreferences that will get expanded with the C(regexp) capture groups if the regexp matches.}
    mode=${12:# The permissions the resulting file or directory should have.For those used to I(/usr/bin/chmod) remember that modes are actually octal numbers. You must either add a leading zero so that Ansible's YAML parser knows it is an octal number (like C(0644) or C(01777)) or quote it (like C('644') or C('1777')) so Ansible receives a string and can do its own conversion from string into number.Giving Ansible a number without following one of these rules will end up with a decimal number which will have unexpected re}
    others=${13:# All arguments accepted by the M(ansible.builtin.file) module also work here.}
    owner=${14:# Name of the user that should own the file/directory, as would be fed to I(chown).}
    regexp=${15:# The regular expression to look for in every line of the file.For C(state=present), the pattern to replace if found. Only the last line found will be replaced.For C(state=absent), the pattern of the line(s) to remove.If the regular expression is not matched, the line will be added to the file in keeping with C(insertbefore) or C(insertafter) settings.When modifying a line the regexp should typically match both the initial state of the line as well as its state after replacement by C(line) to ensure idempoten}
    selevel=${16:# The level part of the SELinux file context.This is the MLS/MCS attribute, sometimes known as the C(range).When set to C(_default), it will use the C(level) portion of the policy if available.}
    serole=${17:# The role part of the SELinux file context.When set to C(_default), it will use the C(role) portion of the policy if available.}
    setype=${18:# The type part of the SELinux file context.When set to C(_default), it will use the C(type) portion of the policy if available.}
    seuser=${19:# The user part of the SELinux file context.By default it uses the C(system) policy, where applicable.When set to C(_default), it will use the C(user) portion of the policy if available.}
    state=${20:absent|#present}
    unsafe_writes=${21:false}
    validate=${22:# The validation command to run before copying into place.The path to the file to validate is passed in via '%s' which must be present as in the examples below.The command is passed securely so shell features like expansion and pipes will not work.}
    ]==];

    -- snippet meta "Execute Ansible 'actions'" b
    ["meta"] = U.match_indentation [==[
    ${1:free_form=clear_facts|clear_host_errors|end_host|end_play|flush_handlers|noop|refresh_inventory|reset_connection}
    ]==];

    -- snippet package "Generic OS package manager" b
    ["package"] = U.match_indentation [==[
    name=${1:# Package name, or package specifier with version.Syntax varies with package manager. For example C(name-1.0) or C(name=1.0).Package names also vary with package manager; this module will not 'translate' them per distro. For example C(libyaml-dev), C(libyaml-devel).}
    state=${2:# Whether to install (C(present)), or remove (C(absent)) a package.You can use other states like C(latest) ONLY if they are supported by the underlying package module(s) executed.}
    use=${4:auto}
    ]==];

    -- snippet package_facts "package information as facts" b
    ["package_facts"] = U.match_indentation [==[
    manager=${1:['#auto', 'rpm', 'apt', 'portage', 'pkg', 'pacman']}
    strategy=${2:#first|all}
    ]==];

    -- snippet pause "Pause playbook execution" b
    ["pause"] = U.match_indentation [==[
    echo=${1:true}
    minutes=${2:# A positive number of minutes to pause for.}
    prompt=${3:# Optional text to use for the prompt message.}
    seconds=${4:# A positive number of seconds to pause for.}
    ]==];

    -- snippet ping "Try to connect to host, verify a usable python and return C(pong) on success" b
    ["ping"] = U.match_indentation [==[
    data=${1:pong}
    ]==];

    -- snippet pip "Manages Python library dependencies" b
    ["pip"] = U.match_indentation [==[
    chdir=${1:# cd into this directory before running the command}
    editable=${2:false}
    executable=${3:# The explicit executable or pathname for the pip executable, if different from the Ansible Python interpreter. For example C(pip3.3), if there are both Python 2.7 and 3.3 installations in the system and you want to run pip for the Python 3.3 installation.Mutually exclusive with I(virtualenv) (added in 2.1).Does not affect the Ansible Python interpreter.The setuptools package must be installed for both the Ansible Python interpreter and for the version of Python specified by this option.}
    extra_args=${4:# Extra arguments passed to pip.}
    name=${5:# The name of a Python library to install or the url(bzr+,hg+,git+,svn+) of the remote package.This can be a list (since 2.2) and contain version specifiers (since 2.7).}
    requirements=${6:# The path to a pip requirements file, which should be local to the remote system. File can be specified as a relative path if using the chdir option.}
    state=${7:absent|forcereinstall|latest|#present}
    umask=${8:# The system umask to apply before installing the pip package. This is useful, for example, when installing on systems that have a very restrictive umask by default (e.g., '0077') and you want to pip install packages which are to be used by all users. Note that this requires you to specify desired umask mode as an octal string, (e.g., '0022').}
    version=${9:# The version number to install of the Python library specified in the I(name) parameter.}
    virtualenv=${10:# An optional path to a I(virtualenv) directory to install into. It cannot be specified together with the 'executable' parameter (added in 2.1). If the virtualenv does not exist, it will be created before installing packages. The optional virtualenv_site_packages, virtualenv_command, and virtualenv_python options affect the creation of the virtualenv.}
    virtualenv_command=${11:virtualenv}
    virtualenv_python=${12:# The Python executable used for creating the virtual environment. For example C(python3.5), C(python2.7). When not specified, the Python version used to run the ansible module is used. This parameter should not be used when C(virtualenv_command) is using C(pyvenv) or the C(-m venv) module.}
    virtualenv_site_packages=${13:false}
    ]==];

    -- snippet raw "Executes a low-down and dirty command" b
    ["raw"] = U.match_indentation [==[
    ${1:free_form=# The raw module takes a free form command to run.There is no parameter actually named 'free form'; see the examples!}
    executable=${3:# Change the shell used to execute the command. Should be an absolute path to the executable.When using privilege escalation (C(become)) a default shell will be assigned if one is not provided as privilege escalation requires a shell.}
    ]==];

    -- snippet reboot "Reboot a machine" b
    ["reboot"] = U.match_indentation [==[
    boot_time_command=${1:cat /proc/sys/kernel/random/boot_id}
    connect_timeout=${2:# Maximum seconds to wait for a successful connection to the managed hosts before trying again.If unspecified, the default setting for the underlying connection plugin is used.}
    msg=${3:Reboot initiated by Ansible}
    post_reboot_delay=${4:0}
    pre_reboot_delay=${5:0}
    reboot_timeout=${6:600}
    search_paths=${7:['/sbin', '/usr/sbin', '/usr/local/sbin']}
    test_command=${8:whoami}
    ]==];

    -- snippet replace "Replace all instances of a particular string in a file using a back-referenced regular expression" b
    ["replace"] = U.match_indentation [==[
    path=${1:# The file to modify.Before Ansible 2.3 this option was only usable as I(dest), I(destfile) and I(name).}
    regexp=${2:# The regular expression to look for in the contents of the file.Uses Python regular expressions; see U(http://docs.python.org/2/library/re.html).Uses MULTILINE mode, which means C(^) and C(\$) match the beginning and end of the file, as well as the beginning and end respectively of I(each line) of the file.Does not use DOTALL, which means the C(.) special character matches any character I(except newlines). A common mistake is to assume that a negated character set like C([^#]) will also not match newlines.In }
    after=${4:# If specified, only content after this match will be replaced/removed.Can be used in combination with C(before).Uses Python regular expressions; see U(http://docs.python.org/2/library/re.html).Uses DOTALL, which means the C(.) special character I(can match newlines).}
    attributes=${5:# The attributes the resulting file or directory should have.To get supported flags look at the man page for I(chattr) on the target system.This string should contain the attributes in the same order as the one displayed by I(lsattr).The C(=) operator is assumed as default, otherwise C(+) or C(-) operators need to be included in the string.}
    backup=${6:false}
    before=${7:# If specified, only content before this match will be replaced/removed.Can be used in combination with C(after).Uses Python regular expressions; see U(http://docs.python.org/2/library/re.html).Uses DOTALL, which means the C(.) special character I(can match newlines).}
    encoding=${8:utf-8}
    group=${9:# Name of the group that should own the file/directory, as would be fed to I(chown).}
    mode=${10:# The permissions the resulting file or directory should have.For those used to I(/usr/bin/chmod) remember that modes are actually octal numbers. You must either add a leading zero so that Ansible's YAML parser knows it is an octal number (like C(0644) or C(01777)) or quote it (like C('644') or C('1777')) so Ansible receives a string and can do its own conversion from string into number.Giving Ansible a number without following one of these rules will end up with a decimal number which will have unexpected re}
    others=${11:# All arguments accepted by the M(ansible.builtin.file) module also work here.}
    owner=${12:# Name of the user that should own the file/directory, as would be fed to I(chown).}
    replace=${13:# The string to replace regexp matches.May contain backreferences that will get expanded with the regexp capture groups if the regexp matches.If not set, matches are removed entirely.Backreferences can be used ambiguously like C(\\1), or explicitly like C(\\g<1>).}
    selevel=${14:# The level part of the SELinux file context.This is the MLS/MCS attribute, sometimes known as the C(range).When set to C(_default), it will use the C(level) portion of the policy if available.}
    serole=${15:# The role part of the SELinux file context.When set to C(_default), it will use the C(role) portion of the policy if available.}
    setype=${16:# The type part of the SELinux file context.When set to C(_default), it will use the C(type) portion of the policy if available.}
    seuser=${17:# The user part of the SELinux file context.By default it uses the C(system) policy, where applicable.When set to C(_default), it will use the C(user) portion of the policy if available.}
    unsafe_writes=${18:false}
    validate=${19:# The validation command to run before copying into place.The path to the file to validate is passed in via '%s' which must be present as in the examples below.The command is passed securely so shell features like expansion and pipes will not work.}
    ]==];

    -- snippet rpm_key "Adds or removes a gpg key from the rpm db" b
    ["rpm_key"] = U.match_indentation [==[
    key=${1:# Key that will be modified. Can be a url, a file on the managed node, or a keyid if the key already exists in the database.}
    fingerprint=${3:# The long-form fingerprint of the key being imported.This will be used to verify the specified key.}
    state=${4:absent|#present}
    validate_certs=${5:true}
    ]==];

    -- snippet script "Runs a local script on a remote node after transferring it" b
    ["script"] = U.match_indentation [==[
    chdir=${1:# Change into this directory on the remote node before running the script.}
    cmd=${2:# Path to the local script to run followed by optional arguments.}
    creates=${3:# A filename on the remote node, when it already exists, this step will B(not) be run.}
    decrypt=${4:true}
    executable=${5:# Name or path of a executable to invoke the script with.}
    ${6:free_form=# Path to the local script file followed by optional arguments.}
    removes=${7:# A filename on the remote node, when it does not exist, this step will B(not) be run.}
    ]==];

    -- snippet service "Manage services" b
    ["service"] = U.match_indentation [==[
    name=${1:# Name of the service.}
    arguments=${3:# Additional arguments provided on the command line.While using remote hosts with systemd this setting will be ignored.}
    enabled=${4:# Whether the service should start on boot.B(At least one of state and enabled are required.)}
    pattern=${5:# If the service does not respond to the status command, name a substring to look for as would be found in the output of the I(ps) command as a stand-in for a status result.If the string is found, the service will be assumed to be started.While using remote hosts with systemd this setting will be ignored.}
    runlevel=${6:default}
    sleep=${7:# If the service is being C(restarted) then sleep this many seconds between the stop and start command.This helps to work around badly-behaving init scripts that exit immediately after signaling a process to stop.Not all service managers support sleep, i.e when using systemd this setting will be ignored.}
    state=${8:reloaded|restarted|started|stopped}
    use=${9:auto}
    ]==];

    -- snippet set_fact "Set host facts from a task" b
    ["set_fact"] = U.match_indentation [==[
    key_value=${1:# The C(set_fact) module takes key=value pairs as variables to set in the playbook scope. Or alternatively, accepts complex arguments using the C(args:) statement.}
    cacheable=${3:false}
    ]==];

    -- snippet set_stats "Set stats for the current ansible run" b
    ["set_stats"] = U.match_indentation [==[
    data=${1:# A dictionary of which each key represents a stat (or variable) you want to keep track of.}
    aggregate=${3:true}
    per_host=${4:false}
    ]==];

    -- snippet setup "Gathers facts about remote hosts" b
    ["setup"] = U.match_indentation [==[
    fact_path=${1:/etc/ansible/facts.d}
    filter=${2:*}
    gather_subset=${3:all}
    gather_timeout=${4:10}
    ]==];

    -- snippet shell "Execute shell commands on targets" b
    ["shell"] = U.match_indentation [==[
    chdir=${1:# Change into this directory before running the command.}
    cmd=${2:# The command to run followed by optional arguments.}
    creates=${3:# A filename, when it already exists, this step will B(not) be run.}
    executable=${4:# Change the shell used to execute the command.This expects an absolute path to the executable.}
    ${5:free_form=# The shell module takes a free form command to run, as a string.There is no actual parameter named 'free form'.See the examples on how to use this module.}
    removes=${6:# A filename, when it does not exist, this step will B(not) be run.}
    stdin=${7:# Set the stdin of the command directly to the specified value.}
    stdin_add_newline=${8:true}
    warn=${9:true}
    ]==];

    -- snippet slurp "Slurps a file from remote nodes" b
    ["slurp"] = U.match_indentation [==[
    src=${1:# The file on the remote system to fetch. This I(must) be a file, not a directory.}
    ]==];

    -- snippet stat "Retrieve file or file system status" b
    ["stat"] = U.match_indentation [==[
    path=${1:# The full path of the file/object to get the facts of.}
    checksum_algorithm=${3:md5|#sha1|sha224|sha256|sha384|sha512}
    follow=${4:false}
    get_attributes=${5:true}
    get_checksum=${6:true}
    get_mime=${7:true}
    ]==];

    -- snippet subversion "Deploys a subversion repository" b
    ["subversion"] = U.match_indentation [==[
    dest=${1:# Absolute path where the repository should be deployed.}
    repo=${2:# The subversion URL to the repository.}
    checkout=${4:true}
    executable=${5:# Path to svn executable to use. If not supplied, the normal mechanism for resolving binary paths will be used.}
    export=${6:false}
    force=${7:false}
    in_place=${8:false}
    password=${9:# C(
    --password) parameter passed to svn when svn is less than version 1.10.0. This is not secure and the password will be leaked to argv.C(--password-from-stdin) parameter when svn is greater or equal to version 1.10.0.}
    revision=${10:HEAD}
    switch=${11:true}
    update=${12:true}
    username=${13:# C(
    --username) parameter passed to svn.}
    ]==];

    -- snippet systemd "Manage services" b
    ["systemd"] = U.match_indentation [==[
    daemon_reexec=${1:false}
    daemon_reload=${2:false}
    enabled=${3:# Whether the service should start on boot. B(At least one of state and enabled are required.)}
    force=${4:# Whether to override existing symlinks.}
    masked=${5:# Whether the unit should be masked or not, a masked unit is impossible to start.}
    name=${6:# Name of the service. This parameter takes the name of exactly one service to work with.When using in a chroot environment you always need to specify the full name i.e. (crond.service).}
    no_block=${7:false}
    scope=${8:#system|user|global}
    state=${9:reloaded|restarted|started|stopped}
    user=${10:# (deprecated) run \`\`systemctl\`\` talking to the service manager of the calling user, rather than the service manager of the system.This option is deprecated and will eventually be removed in 2.11. The \`\`scope\`\` option should be used instead.The default value is C(false).}
    ]==];

    -- snippet sysvinit "Manage SysV services." b
    ["sysvinit"] = U.match_indentation [==[
    name=${1:# Name of the service.}
    arguments=${3:# Additional arguments provided on the command line that some init scripts accept.}
    daemonize=${4:false}
    enabled=${5:# Whether the service should start on boot. B(At least one of state and enabled are required.)}
    pattern=${6:# A substring to look for as would be found in the output of the I(ps) command as a stand-in for a status result.If the string is found, the service will be assumed to be running.This option is mainly for use with init scripts that don't support the 'status' option.}
    runlevels=${7:# The runlevels this script should be enabled/disabled from.Use this to override the defaults set by the package or init script itself.}
    sleep=${8:1}
    state=${9:started|stopped|restarted|reloaded}
    ]==];

    -- snippet tempfile "Creates temporary files and directories" b
    ["tempfile"] = U.match_indentation [==[
    path=${1:# Location where temporary file or directory should be created.If path is not specified, the default system temporary directory will be used.}
    prefix=${2:ansible.}
    state=${3:directory|#file}
    suffix=${4:""}
    ]==];

    -- snippet template "Template a file out to a remote server" b
    ["template"] = U.match_indentation [==[
    dest=${1:# Location to render the template to on the remote machine.}
    src=${2:# Path of a Jinja2 formatted template on the Ansible controller.This can be a relative or an absolute path.The file must be encoded with C(utf-8) but I(output_encoding) can be used to control the encoding of the output template.}
    attributes=${4:# The attributes the resulting file or directory should have.To get supported flags look at the man page for I(chattr) on the target system.This string should contain the attributes in the same order as the one displayed by I(lsattr).The C(=) operator is assumed as default, otherwise C(+) or C(-) operators need to be included in the string.}
    backup=${5:false}
    block_end_string=${6:%\}}
    block_start_string=${7:\{%}
    follow=${8:false}
    force=${9:true}
    group=${10:# Name of the group that should own the file/directory, as would be fed to I(chown).}
    lstrip_blocks=${11:false}
    mode=${12:# The permissions the resulting file or directory should have.For those used to I(/usr/bin/chmod) remember that modes are actually octal numbers. You must either add a leading zero so that Ansible's YAML parser knows it is an octal number (like C(0644) or C(01777)) or quote it (like C('644') or C('1777')) so Ansible receives a string and can do its own conversion from string into number.Giving Ansible a number without following one of these rules will end up with a decimal number which will have unexpected re}
    newline_sequence=${13:#\n|\r|\r\n}
    output_encoding=${14:utf-8}
    owner=${15:# Name of the user that should own the file/directory, as would be fed to I(chown).}
    selevel=${16:# The level part of the SELinux file context.This is the MLS/MCS attribute, sometimes known as the C(range).When set to C(_default), it will use the C(level) portion of the policy if available.}
    serole=${17:# The role part of the SELinux file context.When set to C(_default), it will use the C(role) portion of the policy if available.}
    setype=${18:# The type part of the SELinux file context.When set to C(_default), it will use the C(type) portion of the policy if available.}
    seuser=${19:# The user part of the SELinux file context.By default it uses the C(system) policy, where applicable.When set to C(_default), it will use the C(user) portion of the policy if available.}
    trim_blocks=${20:true}
    unsafe_writes=${21:false}
    validate=${22:# The validation command to run before copying into place.The path to the file to validate is passed in via '%s' which must be present as in the examples below.The command is passed securely so shell features like expansion and pipes will not work.}
    variable_end_string=${23:\}\}}
    variable_start_string=${24:\{\{}
    ]==];

    -- snippet unarchive "Unpacks an archive after (optionally) copying it from the local machine." b
    ["unarchive"] = U.match_indentation [==[
    dest=${1:# Remote absolute path where the archive should be unpacked.}
    src=${2:# If C(remote_src=no) (default), local path to archive file to copy to the target server; can be absolute or relative. If C(remote_src=yes), path on the target server to existing archive file to unpack.If C(remote_src=yes) and C(src) contains C(://), the remote machine will download the file from the URL first. (version_added 2.0). This is only for simple cases, for full download support use the M(ansible.builtin.get_url) module.}
    attributes=${4:# The attributes the resulting file or directory should have.To get supported flags look at the man page for I(chattr) on the target system.This string should contain the attributes in the same order as the one displayed by I(lsattr).The C(=) operator is assumed as default, otherwise C(+) or C(-) operators need to be included in the string.}
    copy=${5:true}
    creates=${6:# If the specified absolute path (file or directory) already exists, this step will B(not) be run.}
    decrypt=${7:true}
    exclude=${8:# List the directory and file entries that you would like to exclude from the unarchive action.}
    extra_opts=${9:""}
    group=${10:# Name of the group that should own the file/directory, as would be fed to I(chown).}
    keep_newer=${11:false}
    list_files=${12:false}
    mode=${13:# The permissions the resulting file or directory should have.For those used to I(/usr/bin/chmod) remember that modes are actually octal numbers. You must either add a leading zero so that Ansible's YAML parser knows it is an octal number (like C(0644) or C(01777)) or quote it (like C('644') or C('1777')) so Ansible receives a string and can do its own conversion from string into number.Giving Ansible a number without following one of these rules will end up with a decimal number which will have unexpected re}
    owner=${14:# Name of the user that should own the file/directory, as would be fed to I(chown).}
    remote_src=${15:false}
    selevel=${16:# The level part of the SELinux file context.This is the MLS/MCS attribute, sometimes known as the C(range).When set to C(_default), it will use the C(level) portion of the policy if available.}
    serole=${17:# The role part of the SELinux file context.When set to C(_default), it will use the C(role) portion of the policy if available.}
    setype=${18:# The type part of the SELinux file context.When set to C(_default), it will use the C(type) portion of the policy if available.}
    seuser=${19:# The user part of the SELinux file context.By default it uses the C(system) policy, where applicable.When set to C(_default), it will use the C(user) portion of the policy if available.}
    unsafe_writes=${20:false}
    validate_certs=${21:true}
    ]==];

    -- snippet uri "Interacts with webservices" b
    ["uri"] = U.match_indentation [==[
    url=${1:# HTTP or HTTPS URL in the form (http|https)://host.domain[:port]/path}
    attributes=${3:# The attributes the resulting file or directory should have.To get supported flags look at the man page for I(chattr) on the target system.This string should contain the attributes in the same order as the one displayed by I(lsattr).The C(=) operator is assumed as default, otherwise C(+) or C(-) operators need to be included in the string.}
    body=${4:# The body of the http request/response to the web service. If C(body_format) is set to 'json' it will take an already formatted JSON string or convert a data structure into JSON.If C(body_format) is set to 'form-urlencoded' it will convert a dictionary or list of tuples into an 'application/x-www-form-urlencoded' string. (Added in v2.7)If C(body_format) is set to 'form-multipart' it will convert a dictionary into 'multipart/form-multipart' body. (Added in v2.10)}
    body_format=${5:form-urlencoded|json|#raw|form-multipart}
    client_cert=${6:# PEM formatted certificate chain file to be used for SSL client authentication.This file can also include the key as well, and if the key is included, I(client_key) is not required}
    client_key=${7:# PEM formatted file that contains your private key to be used for SSL client authentication.If I(client_cert) contains both the certificate and key, this option is not required.}
    creates=${8:# A filename, when it already exists, this step will not be run.}
    dest=${9:# A path of where to download the file to (if desired). If I(dest) is a directory, the basename of the file on the remote server will be used.}
    follow_redirects=${10:all|no|none|#safe|urllib2|yes}
    force=${11:false}
    force_basic_auth=${12:false}
    group=${13:# Name of the group that should own the file/directory, as would be fed to I(chown).}
    headers=${14:# Add custom HTTP headers to a request in the format of a YAML hash. As of C(2.3) supplying C(Content-Type) here will override the header generated by supplying C(json) or C(form-urlencoded) for I(body_format).}
    http_agent=${15:ansible-httpget}
    method=${16:GET}
    mode=${17:# The permissions the resulting file or directory should have.For those used to I(/usr/bin/chmod) remember that modes are actually octal numbers. You must either add a leading zero so that Ansible's YAML parser knows it is an octal number (like C(0644) or C(01777)) or quote it (like C('644') or C('1777')) so Ansible receives a string and can do its own conversion from string into number.Giving Ansible a number without following one of these rules will end up with a decimal number which will have unexpected re}
    owner=${18:# Name of the user that should own the file/directory, as would be fed to I(chown).}
    remote_src=${19:false}
    removes=${20:# A filename, when it does not exist, this step will not be run.}
    return_content=${21:false}
    selevel=${22:# The level part of the SELinux file context.This is the MLS/MCS attribute, sometimes known as the C(range).When set to C(_default), it will use the C(level) portion of the policy if available.}
    serole=${23:# The role part of the SELinux file context.When set to C(_default), it will use the C(role) portion of the policy if available.}
    setype=${24:# The type part of the SELinux file context.When set to C(_default), it will use the C(type) portion of the policy if available.}
    seuser=${25:# The user part of the SELinux file context.By default it uses the C(system) policy, where applicable.When set to C(_default), it will use the C(user) portion of the policy if available.}
    src=${26:# Path to file to be submitted to the remote server.Cannot be used with I(body).}
    status_code=${27:[200]}
    timeout=${28:30}
    unix_socket=${29:# Path to Unix domain socket to use for connection}
    unsafe_writes=${30:false}
    url_password=${31:# A password for the module to use for Digest, Basic or WSSE authentication.}
    url_username=${32:# A username for the module to use for Digest, Basic or WSSE authentication.}
    use_proxy=${33:true}
    validate_certs=${34:true}
    ]==];

    -- snippet user "Manage user accounts" b
    ["user"] = U.match_indentation [==[
    name=${1:# Name of the user to create, remove or modify.}
    append=${3:false}
    authorization=${4:# Sets the authorization of the user.Does nothing when used with other platforms.Can set multiple authorizations using comma separation.To delete all authorizations, use C(authorization='').Currently supported on Illumos/Solaris.}
    comment=${5:# Optionally sets the description (aka I(GECOS)) of user account.}
    create_home=${6:true}
    expires=${7:# An expiry time for the user in epoch, it will be ignored on platforms that do not support this.Currently supported on GNU/Linux, FreeBSD, and DragonFlyBSD.Since Ansible 2.6 you can remove the expiry time by specifying a negative value. Currently supported on GNU/Linux and FreeBSD.}
    force=${8:false}
    generate_ssh_key=${9:false}
    group=${10:# Optionally sets the user's primary group (takes a group name).}
    groups=${11:# List of groups user will be added to. When set to an empty string C(''), the user is removed from all groups except the primary group.Before Ansible 2.3, the only input format allowed was a comma separated string.}
    hidden=${12:# macOS only, optionally hide the user from the login window and system preferences.The default will be C(yes) if the I(system) option is used.}
    home=${13:# Optionally set the user's home directory.}
    local=${14:false}
    login_class=${15:# Optionally sets the user's login class, a feature of most BSD OSs.}
    move_home=${16:false}
    non_unique=${17:false}
    password=${18:# Optionally set the user's password to this crypted value.On macOS systems, this value has to be cleartext. Beware of security issues.To create a disabled account on Linux systems, set this to C('!') or C('*').To create a disabled account on OpenBSD, set this to C('*************').See U(https://docs.ansible.com/ansible/faq.html#how-do-i-generate-encrypted-passwords-for-the-user-module) for details on various ways to generate these password values.}
    password_lock=${19:# Lock the password (usermod -L, pw lock, usermod -C).BUT implementation differs on different platforms, this option does not always mean the user cannot login via other methods.This option does not disable the user, only lock the password. Do not change the password in the same task.Currently supported on Linux, FreeBSD, DragonFlyBSD, NetBSD, OpenBSD.}
    profile=${20:# Sets the profile of the user.Does nothing when used with other platforms.Can set multiple profiles using comma separation.To delete all the profiles, use C(profile='').Currently supported on Illumos/Solaris.}
    remove=${21:false}
    role=${22:# Sets the role of the user.Does nothing when used with other platforms.Can set multiple roles using comma separation.To delete all roles, use C(role='').Currently supported on Illumos/Solaris.}
    seuser=${23:# Optionally sets the seuser type (user_u) on selinux enabled systems.}
    shell=${24:# Optionally set the user's shell.On macOS, before Ansible 2.5, the default shell for non-system users was C(/usr/bin/false). Since Ansible 2.5, the default shell for non-system users on macOS is C(/bin/bash).On other operating systems, the default shell is determined by the underlying tool being used. See Notes for details.}
    skeleton=${25:# Optionally set a home skeleton directory.Requires C(create_home) option!}
    ssh_key_bits=${26:default set by ssh-keygen}
    ssh_key_comment=${27:ansible-generated on \$HOSTNAME}
    ssh_key_file=${28:# Optionally specify the SSH key filename.If this is a relative filename then it will be relative to the user's home directory.This parameter defaults to I(.ssh/id_rsa).}
    ssh_key_passphrase=${29:# Set a passphrase for the SSH key.If no passphrase is provided, the SSH key will default to having no passphrase.}
    ssh_key_type=${30:rsa}
    state=${31:absent|#present}
    system=${32:false}
    uid=${33:# Optionally sets the I(UID) of the user.}
    update_password=${34:#always|on_create}
    ]==];

    -- snippet wait_for "Waits for a condition before continuing" b
    ["wait_for"] = U.match_indentation [==[
    active_connection_states=${1:['ESTABLISHED', 'FIN_WAIT1', 'FIN_WAIT2', 'SYN_RECV', 'SYN_SENT', 'TIME_WAIT']}
    connect_timeout=${2:5}
    delay=${3:0}
    exclude_hosts=${4:# List of hosts or IPs to ignore when looking for active TCP connections for C(drained) state.}
    host=${5:127.0.0.1}
    msg=${6:# This overrides the normal error message from a failure to meet the required conditions.}
    path=${7:# Path to a file on the filesystem that must exist before continuing.C(path) and C(port) are mutually exclusive parameters.}
    port=${8:# Port number to poll.C(path) and C(port) are mutually exclusive parameters.}
    search_regex=${9:# Can be used to match a string in either a file or a socket connection.Defaults to a multiline regex.}
    sleep=${10:1}
    state=${11:absent|drained|present|#started|stopped}
    timeout=${12:300}
    ]==];

    -- snippet wait_for_connection "Waits until remote system is reachable/usable" b
    ["wait_for_connection"] = U.match_indentation [==[
    connect_timeout=${1:5}
    delay=${2:0}
    sleep=${3:1}
    timeout=${4:600}
    ]==];

    -- snippet yum "Manages packages with the I(yum) package manager" b
    ["yum"] = U.match_indentation [==[
    allow_downgrade=${1:false}
    autoremove=${2:false}
    bugfix=${3:no}
    conf_file=${4:# The remote yum configuration file to use for the transaction.}
    disable_excludes=${5:# Disable the excludes defined in YUM config files.If set to C(all), disables all excludes.If set to C(main), disable excludes defined in [main] in yum.conf.If set to C(repoid), disable excludes defined for given repo id.}
    disable_gpg_check=${6:false}
    disable_plugin=${7:# I(Plugin) name to disable for the install/update operation. The disabled plugins will not persist beyond the transaction.}
    disablerepo=${8:# I(Repoid) of repositories to disable for the install/update operation. These repos will not persist beyond the transaction. When specifying multiple repos, separate them with a C(',').As of Ansible 2.7, this can alternatively be a list instead of C(',') separated string}
    download_dir=${9:# Specifies an alternate directory to store packages.Has an effect only if I(download_only) is specified.}
    download_only=${10:false}
    enable_plugin=${11:# I(Plugin) name to enable for the install/update operation. The enabled plugin will not persist beyond the transaction.}
    enablerepo=${12:# I(Repoid) of repositories to enable for the install/update operation. These repos will not persist beyond the transaction. When specifying multiple repos, separate them with a C(',').As of Ansible 2.7, this can alternatively be a list instead of C(',') separated string}
    exclude=${13:# Package name(s) to exclude when state=present, or latest}
    install_repoquery=${14:true}
    install_weak_deps=${15:true}
    installroot=${16:/}
    list=${17:# Package name to run the equivalent of yum list
    --show-duplicates <package> against. In addition to listing packages, use can also list the following: C(installed), C(updates), C(available) and C(repos).This parameter is mutually exclusive with C(name).}
    lock_timeout=${18:30}
    name=${19:# A package name or package specifier with version, like C(name-1.0).If a previous version is specified, the task also needs to turn C(allow_downgrade) on. See the C(allow_downgrade) documentation for caveats with downgrading packages.When using state=latest, this can be C('*') which means run C(yum -y update).You can also pass a url or a local path to a rpm file (using state=present). To operate on several packages this can accept a comma separated string of packages or (as of 2.0) a list of packages.}
    releasever=${20:# Specifies an alternative release from which all packages will be installed.}
    security=${21:false}
    skip_broken=${22:false}
    state=${23:absent|installed|latest|present|removed}
    update_cache=${24:false}
    update_only=${25:false}
    use_backend=${26:#auto|yum|yum4|dnf}
    validate_certs=${27:true}
    ]==];

    -- snippet yum_repository "Add or remove YUM repositories" b
    ["yum_repository"] = U.match_indentation [==[
    name=${1:# Unique repository ID. This option builds the section name of the repository in the repo file.This parameter is only required if I(state) is set to C(present) or C(absent).}
    async=${3:true}
    attributes=${4:# The attributes the resulting file or directory should have.To get supported flags look at the man page for I(chattr) on the target system.This string should contain the attributes in the same order as the one displayed by I(lsattr).The C(=) operator is assumed as default, otherwise C(+) or C(-) operators need to be included in the string.}
    bandwidth=${5:0}
    baseurl=${6:# URL to the directory where the yum repository's 'repodata' directory lives.It can also be a list of multiple URLs.This, the I(metalink) or I(mirrorlist) parameters are required if I(state) is set to C(present).}
    cost=${7:1000}
    deltarpm_metadata_percentage=${8:100}
    deltarpm_percentage=${9:75}
    description=${10:# A human readable string describing the repository. This option corresponds to the 'name' property in the repo file.This parameter is only required if I(state) is set to C(present).}
    enabled=${11:true}
    enablegroups=${12:true}
    exclude=${13:# List of packages to exclude from updates or installs. This should be a space separated list. Shell globs using wildcards (eg. C(*) and C(?)) are allowed.The list can also be a regular YAML array.}
    failovermethod=${14:#roundrobin|priority}
    file=${15:# File name without the C(.repo) extension to save the repo in. Defaults to the value of I(name).}
    gpgcakey=${16:# A URL pointing to the ASCII-armored CA key file for the repository.}
    gpgcheck=${17:# Tells yum whether or not it should perform a GPG signature check on packages.No default setting. If the value is not set, the system setting from C(/etc/yum.conf) or system default of C(no) will be used.}
    gpgkey=${18:# A URL pointing to the ASCII-armored GPG key file for the repository.It can also be a list of multiple URLs.}
    group=${19:# Name of the group that should own the file/directory, as would be fed to I(chown).}
    http_caching=${20:#all|packages|none}
    include=${21:# Include external configuration file. Both, local path and URL is supported. Configuration file will be inserted at the position of the I(include=) line. Included files may contain further include lines. Yum will abort with an error if an inclusion loop is detected.}
    includepkgs=${22:# List of packages you want to only use from a repository. This should be a space separated list. Shell globs using wildcards (eg. C(*) and C(?)) are allowed. Substitution variables (e.g. C(\$releasever)) are honored here.The list can also be a regular YAML array.}
    ip_resolve=${23:4|6|IPv4|IPv6|#whatever}
    keepalive=${24:false}
    keepcache=${25:0|#1}
    metadata_expire=${26:21600}
    metadata_expire_filter=${27:never|read-only:past|#read-only:present|read-only:future}
    metalink=${28:# Specifies a URL to a metalink file for the repomd.xml, a list of mirrors for the entire repository are generated by converting the mirrors for the repomd.xml file to a I(baseurl).This, the I(baseurl) or I(mirrorlist) parameters are required if I(state) is set to C(present).}
    mirrorlist=${29:# Specifies a URL to a file containing a list of baseurls.This, the I(baseurl) or I(metalink) parameters are required if I(state) is set to C(present).}
    mirrorlist_expire=${30:21600}
    mode=${31:# The permissions the resulting file or directory should have.For those used to I(/usr/bin/chmod) remember that modes are actually octal numbers. You must either add a leading zero so that Ansible's YAML parser knows it is an octal number (like C(0644) or C(01777)) or quote it (like C('644') or C('1777')) so Ansible receives a string and can do its own conversion from string into number.Giving Ansible a number without following one of these rules will end up with a decimal number which will have unexpected re}
    owner=${32:# Name of the user that should own the file/directory, as would be fed to I(chown).}
    password=${33:# Password to use with the username for basic authentication.}
    priority=${34:99}
    protect=${35:false}
    proxy=${36:# URL to the proxy server that yum should use. Set to C(_none_) to disable the global proxy setting.}
    proxy_password=${37:# Password for this proxy.}
    proxy_username=${38:# Username to use for proxy.}
    repo_gpgcheck=${39:false}
    reposdir=${40:/etc/yum.repos.d}
    retries=${41:10}
    s3_enabled=${42:false}
    selevel=${43:# The level part of the SELinux file context.This is the MLS/MCS attribute, sometimes known as the C(range).When set to C(_default), it will use the C(level) portion of the policy if available.}
    serole=${44:# The role part of the SELinux file context.When set to C(_default), it will use the C(role) portion of the policy if available.}
    setype=${45:# The type part of the SELinux file context.When set to C(_default), it will use the C(type) portion of the policy if available.}
    seuser=${46:# The user part of the SELinux file context.By default it uses the C(system) policy, where applicable.When set to C(_default), it will use the C(user) portion of the policy if available.}
    skip_if_unavailable=${47:false}
    ssl_check_cert_permissions=${48:false}
    sslcacert=${49:# Path to the directory containing the databases of the certificate authorities yum should use to verify SSL certificates.}
    sslclientcert=${50:# Path to the SSL client certificate yum should use to connect to repos/remote sites.}
    sslclientkey=${51:# Path to the SSL client key yum should use to connect to repos/remote sites.}
    sslverify=${52:true}
    state=${53:absent|#present}
    throttle=${54:# Enable bandwidth throttling for downloads.This option can be expressed as a absolute data rate in bytes/sec. An SI prefix (k, M or G) may be appended to the bandwidth value.}
    timeout=${55:30}
    ui_repoid_vars=${56:releasever basearch}
    unsafe_writes=${57:false}
    username=${58:# Username to use for basic authentication to a repo or really any url.}
    ]==];
  }
}
